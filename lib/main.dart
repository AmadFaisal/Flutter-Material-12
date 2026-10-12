import 'package:flutter/material.dart';
import 'package:rpl2/latihan3/LayoutProfile1.dart';
import 'package:rpl2/latihan3/LayoutProfile2.dart';
import 'package:rpl2/latihan3/LayoutProfile3.dart';
import 'package:rpl2/latihan3/latihan3.dart';
import 'package:rpl2/latihan3/profile.dart';
import 'package:rpl2/latihan3/LayoutSatu.dart';
import 'package:rpl2/list_grid/listview/BasicListview.dart';
import 'package:rpl2/list_grid/listview/BuilderListView.dart';
import 'package:rpl2/list_grid/listview/ContohListView.dart';
import 'package:rpl2/list_grid/listview/SeparatedListView.dart';
import 'package:rpl2/list_grid/listview/simpleListView.dart';

// import 'package:rpl2/listview/simpleListView.dart';
// import 'package:rpl2/latihan3/latihan3.dart';
// import 'package:rpl2/size_expand_stack/expandedWid.dart';
// import 'package:rpl2/size_expand_stack/sizeBox.dart';
// import 'package:rpl2/size_expand_stack/stackWidga.dart';

// import 'package:rpl2/ContainerWidget/ContainerSatu.dart';
// import 'package:rpl2/columnwidget/column_widget.dart';
// import 'package:rpl2/latihan/LatihanContainer.dart';
// import 'package:rpl2/rowColumnWidget/RowWudget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter RPL 2 Apps',
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'My First Flutter Apps',
        //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        //   ),
        //   backgroundColor: Colors.orangeAccent,
        //   centerTitle: true,
        // ),
        body: ContohListView(),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello, World!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.orangeAccent,
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
