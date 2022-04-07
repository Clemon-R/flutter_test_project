import 'package:test_project/back/http_models/users_http_model.dart';
import 'package:test_project/dependencies_provider.dart';
import 'package:test_project/job/models/users_model.dart';
import 'package:test_project/job/repositories/iusers_repository.dart';
import 'package:test_project/job/services/http_service/enums/http_urls.dart';
import 'package:test_project/job/services/http_service/ihttp_service.dart';
import 'package:test_project/job/services/http_service/models/http_request.dart';

class UsersRepository extends IUsersRepository {
  final IHttpService _httpService = DependenciesProvider.get();

  @override
  Future<UsersModel> fetchUsers({required int page}) async {
    var result = await _httpService.get<UsersHttpModel>(
      HttpRequest(
        url: HttpUrls.root,
        fromJson: (json) => UsersHttpModel.fromJson(json),
        params: {
          "page": page.toString(),
        },
      ),
    );
    return result.response.toModel();
  }
}
