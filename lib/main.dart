import 'package:eme_store/src/bloc/provider.dart';
import 'package:eme_store/src/screens/home_page.dart';
import 'package:eme_store/src/screens/login_page.dart';
import 'package:eme_store/src/screens/register_page.dart';
import 'package:eme_store/src/screens/resetPass_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eme Stroe',
        initialRoute: 'login',
        routes: {
          'home'      :   (context) => HomePage(),
          'login'     :   (context) => LoginPage(),
          'register'  :   (context) => RegisterPage(),
          'reset'     :   (context) => ResetPage()
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(129, 189, 74, 1),
          fontFamily: 'Clother'
        ),
      ),
    );
    
    
    
  }
}