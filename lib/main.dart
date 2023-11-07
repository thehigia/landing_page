import 'package:flutter/material.dart';
import 'package:portalhigia/formulario.dart';
import 'package:portalhigia/screens/osistema/osistema_screen.dart';
import 'package:portalhigia/screens/planos/planos_screen.dart';
import 'package:portalhigia/screens/quemsomos/quemsomos_screen.dart';

import 'screens/homepage/homepage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Higia.com',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            fontFamily: 'Roboto',
            textTheme: TextTheme(
              // headline1: TextStyle(
              //     fontFamily: 'Roboto-Medium',
              //     fontWeight: FontWeight.w200,
              //     fontSize: 50,
              //     color: kPrimaryColor),
            
              // button: TextStyle(
              //     fontFamily: 'Roboto-Bold',
              //     fontSize: 14.0,
              //     letterSpacing: 1.25),
            )),
        home: HomePage(),
        // home: FormularioPage(),
        
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new HomePage(),
          '/quemsomos': (BuildContext context) => new QuemSomos(),
          '/osistema': (BuildContext context) => new OSistema(),
          '/planos': (BuildContext context) => new Planos(),
        });
  }
}
