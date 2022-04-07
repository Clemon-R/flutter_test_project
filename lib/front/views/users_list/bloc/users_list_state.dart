import 'package:test_project/job/models/users_model.dart';

abstract class UsersListState {}

class UsersListLoadingState extends UsersListState {}

class UsersListDefaultState extends UsersListState {
  final UsersModel users;
  final bool resetSearch;

  UsersListDefaultState({required this.users, required this.resetSearch});
}
