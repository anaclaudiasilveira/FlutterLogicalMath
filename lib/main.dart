import 'package:flutter/material.dart';
import 'package:maths/cadastro.dart';
import 'package:maths/curiosidades.dart';
import 'package:maths/home_page.dart';
import 'package:maths/login.dart';
import 'package:maths/register/splash_page.dart';
import 'package:maths/register/staps/five_page.dart';
import 'package:maths/register/staps/four_page.dart';
import 'package:maths/register/staps/one_page.dart';
import 'package:maths/register/staps/seven_page.dart';
import 'package:maths/register/staps/six_page.dart';
import 'package:maths/register/staps/two_page.dart';
import 'package:maths/register/staps/three_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MATH\'s',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => HomePage(),
        //'/register': (context) => RegisterModel(),
        '/cadastro': (context) => CadastroPage(),
        '/jogo1': (context) => OnePage(),
        '/jogo2': (context) => TwoPage(),
        '/jogo3': (context) => ThreePage(),
        '/jogo4': (context) => FourPage(),
        '/jogo5': (context) => FivePage(),
        '/jogo6': (context) => SixPage(),
        '/jogo7': (context) => SevenPage(),
        '/login':(context) => LoginPage(),

        'curiosidades':(context) => CuriosidadesPage(),

      },
    );
  }
}


