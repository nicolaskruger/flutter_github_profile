import 'package:flutter/material.dart';
import 'package:github_user_search/user_info/user_info_page.dart';
import 'package:github_user_search/user_search/user_search_page.dart';

void main() {
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
