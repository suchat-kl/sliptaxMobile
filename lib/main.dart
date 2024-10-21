
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:facesliptax/dataProvider/loginDetail.dart';
import 'package:facesliptax/menu/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        Provider<LoginDetail>(create: (_) => LoginDetail()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // '/':(context)=>MyLoginPage(title: 'เข้าระบบ'),
          '/menu':(context)=>Menu(title: LoginDetail().titleBar)
        },
        initialRoute: '/menu',
        title: 'ระบบงานออกใบรับรองภาษีสลิปรายบุคคล',
        theme: ThemeData(
          // colorScheme: ColorScheme(
          //   brightness: Brightness.light,
          //   primary: Colors.black,
          //   onPrimary: Colors.black,
          //   secondary: Colors.green.shade200,
          //   onSecondary: Colors.green.shade200,
          //   background: Colors.white,
          //   onBackground: Colors.white,
          //   surface: Colors.green,
          //   onSurface: Colors.green,
          //   error: Colors.red,
          //   onError: Colors.red,
          // ),
          // primarySwatch: Colors.green,
        ),
        // home:MyLoginPage(title: 'เข้าระบบ'),  // MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}


