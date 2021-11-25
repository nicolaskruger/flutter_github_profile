import 'package:github_user_search/user_search/user_model.dart';
import 'package:github_user_search/user_search/user_repository.dart';

class UserSearchController {
  final UserSearchRepository repository = UserSearchRepository();
  List<UserModel> resultedUsers = [];
  String searchText = '';

  searchUsersByText() async {
    if (searchText.trim().isEmpty) {
      return;
    }

    resultedUsers = await repository.searchByText(searchText);
  }
}
