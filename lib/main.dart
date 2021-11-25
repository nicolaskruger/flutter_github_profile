import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_search/user_info/user_info_controller.dart';
import 'package:github_user_search/user_info/user_info_page.dart';
import 'package:github_user_search/user_info/user_info_repository.dart';
import 'package:github_user_search/user_search/user_repository.dart';
import 'package:github_user_search/user_search/user_search_controller.dart';
import 'package:github_user_search/user_search/user_search_page.dart';

void setUpGetIt() {
  Dio dio = Dio();
  GetIt.I.registerSingleton(UserInfoRepository(provider: dio));
  GetIt.I.registerFactory(() => UserInfoController(repository: GetIt.I.get()));

  GetIt.I.registerSingleton(UserSearchRepository(provider: dio));
  GetIt.I
      .registerFactory(() => UserSearchController(repository: GetIt.I.get()));
}

void main() {
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: UserSearchPage.route,
      routes: {
        UserSearchPage.route: (_) => const UserSearchPage(),
        UserInfoPage.route: (context) => UserInfoPage(
              args: ModalRoute.of(context)?.settings.arguments
                  as UserInfoPageArgs,
            ),
      },
    );
  }
}
