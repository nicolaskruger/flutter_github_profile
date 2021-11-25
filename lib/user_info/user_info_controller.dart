import 'package:github_user_search/user_info/user_info_model.dart';
import 'package:github_user_search/user_info/user_info_repository.dart';

class UserInfoController {
  final UserInfoRepository repository = UserInfoRepository();
  UserInfoModel? model;

  Future<void> fetchUserInfo(int id) async {
    model = await repository.fetchUserInfoById(id);
  }
}
