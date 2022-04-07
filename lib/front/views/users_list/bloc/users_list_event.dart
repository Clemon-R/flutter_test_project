abstract class UsersListEvent {}

class UserListLoadMoreEvent extends UsersListEvent {}

class UserListSearchEvent extends UsersListEvent {
  final String search;

  UserListSearchEvent({required this.search});
}
