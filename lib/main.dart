import 'package:age_calender/Home_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const Router());
}

class Router extends StatelessWidget {
  const Router({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ) ;
  }
}