import 'package:flutter/material.dart';
import 'package:rpl2/form/Bioskop/MovieList_page.dart';
import 'package:rpl2/form/bioskop.dart';
import 'package:rpl2/form/formPage.dart';
import 'package:rpl2/latihan3/LatihanStatus.dart';
import 'package:rpl2/list_grid/grid_view/GridBuilder.dart';
import 'package:rpl2/list_grid/grid_view/Gridbasic.dart';
import 'package:rpl2/list_grid/listview/BasicListview.dart';
import 'package:rpl2/pages/aboutPage.dart';
import 'package:rpl2/pages/homePage.dart';
import 'package:rpl2/pages/input_page.dart'; // ie yeuh

class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const list_basic = '/list_basic';
  static const gridBasic = '/grid_basic';
  static const gridBuilder = '/gridbuilder';
  static const form = '/form';
  static const instagram = '/instagram';
  static const inputForm = '/input-form';
  static const bioskop = '/bioskop';
  static const cinema = '/cinema-app';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => Homepage(),
    about: (context) => AboutPage(),
    list_basic: (context) => BasicListview(),
    gridBasic: (context) => GridBasic(),
    gridBuilder: (context) => GridBuilderProduct(),
    form: (context) => Formpage(),
    instagram: (context) => LatihanStatus(),
    inputForm: (context) => BelajarForm(), // nu ie urang mah
    bioskop: (context) => Cinema(),
    cinema: (context) => CinemaApp(),
  };
}
