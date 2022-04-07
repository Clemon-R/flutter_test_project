import 'package:test_project/job/iservice.dart';
import 'package:test_project/job/models/users_model.dart';

abstract class IUsersRepository extends IService {
  Future<UsersModel> fetchUsers({required int page});
}
