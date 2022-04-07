import 'package:bloc/bloc.dart';
import 'package:test_project/dependencies_provider.dart';
import 'package:test_project/job/models/users_model.dart';
import 'package:test_project/job/repositories/iusers_repository.dart';

import 'users_list_event.dart';
import 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final IUsersRepository _usersRepository = DependenciesProvider.get();
  late UsersModel _users;
  int _currentPage = 1;

  UsersListBloc() : super(UsersListLoadingState()) {
    _usersRepository.fetchUsers(page: 1).then((value) {
      _users = value;
      emit(UsersListDefaultState(users: _users, resetSearch: true));
    });
    _handleLoadMore();
    _handleSearch();
  }

  _handleLoadMore() {
    on<UserListLoadMoreEvent>((event, emit) async {
      _currentPage++;
      var result = await _usersRepository.fetchUsers(page: _currentPage);
      _users.users.addAll(result.users);
      emit(UsersListDefaultState(users: _users, resetSearch: true));
    });
  }

  _handleSearch() {
    on<UserListSearchEvent>((event, emit) async {
      emit(
        UsersListDefaultState(
          users: UsersModel(
            users: _users.users
                .where((u) => u.fullName
                    .toLowerCase()
                    .contains(event.search.toLowerCase()))
                .toList(),
          ),
          resetSearch: false,
        ),
      );
    });
  }
}
