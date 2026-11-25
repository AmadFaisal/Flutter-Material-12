// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:rpl2/latihan3/LayoutProfile1.dart';
import 'package:rpl2/latihan3/LayoutProfile2.dart';
import 'package:rpl2/latihan3/LayoutProfile3.dart';
import 'package:rpl2/latihan3/latihan3.dart';
import 'package:rpl2/latihan3/profile.dart';
import 'package:rpl2/latihan3/LayoutSatu.dart';
import 'package:rpl2/latihan3/LatihanStatus.dart';
import 'package:rpl2/list_grid/grid_view/GridBuilder.dart';
import 'package:rpl2/list_grid/grid_view/Gridbasic.dart';
import 'package:rpl2/list_grid/listview/BasicListview.dart';
import 'package:rpl2/list_grid/listview/BuilderListView.dart';
import 'package:rpl2/list_grid/listview/ContohListView.dart';
import 'package:rpl2/list_grid/listview/SeparatedListView.dart';
import 'package:rpl2/list_grid/listview/simpleListView.dart';
import 'package:rpl2/pages/LoginPages.dart';
import 'package:rpl2/pages/article_list_page.dart';
import 'package:rpl2/pages/homePage.dart';
// import 'package:rpl2/pages/home_page.dart';
import 'package:rpl2/routes/app_routes.dart';
import 'package:rpl2/services/auth_service.dart';

// import 'package:rpl2/listview/simpleListView.dart';
// import 'package:rpl2/latihan3/latihan3.dart';
// import 'package:rpl2/size_expand_stack/expandedWid.dart';
// import 'package:rpl2/size_expand_stack/sizeBox.dart';
// import 'package:rpl2/size_expand_stack/stackWidga.dart';

// import 'package:rpl2/ContainerWidget/ContainerSatu.dart';
// import 'package:rpl2/columnwidget/column_widget.dart';
// import 'package:rpl2/latihan/LatihanContainer.dart';
// import 'package:rpl2/rowColumnWidget/RowWudget.dart';

// void main() {
//   runApp(MyApp());
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final token = await AuthService().getToken();
//   runApp(MyApp(isLoggedIn: token != null));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter RPL 2 Apps',
//       color: Colors.blue,
//       debugShowCheckedModeBanner: false,
//       initialRoute: AppRoutes.home,
//       routes: AppRoutes.routes,
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;
//   const MyApp({super.key, required this.isLoggedIn});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: isLoggedIn ? const ArticleListPage() : const LoginPage(),
//     );
//   }
// }

// class HelloWidget extends StatelessWidget {
//   const new({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         "Hello, World!",
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           backgroundColor: Colors.orangeAccent,
//           color: Colors.black,
//           fontStyle: FontStyle.italic,
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'pages/article_list_page.dart';
// import 'pages/login_page.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AuthService().getToken();
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const ArticleListPage() : const LoginPage(),
    );
  }
}