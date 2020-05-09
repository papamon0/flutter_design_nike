import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/nike_detalle.dart';
import 'package:disenos/src/pages/nike_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( 
        SystemUiOverlayStyle.light.copyWith( statusBarColor: Colors.transparent )       
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'nike',
      routes: {
        'basico'     : (BuildContext context) => BasicoPage(),
        'scroll'     : (BuildContext context) => ScrollPage(),
        'botones'    : (BuildContext context) => BotonesPage(),
        'nike'       : (BuildContext context) => NikePage(),
        'detalle'    : (BuildContext context) => NikeDetalle(),
      },
    );
  }
}