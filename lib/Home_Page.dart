import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  
 

  int age=-1;
 DateTime pickedDate=DateTime.now();
  late DateDuration duration=AgeCalculator.age(pickedDate);
  
@override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculator"),
      ),
      
      body:Column(children: [
                            Text("What is your Birth Date?"),
                                  SizedBox(
                                      width: 200,
                                      child: FittedBox(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.black,
                                                backgroundColor: Colors.amber),
                                            onPressed: () async {
                                              
                                              await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1850),
                                                lastDate: DateTime.now(),
                                              ).then((value) {
                                                pickedDate = value!;
                                                duration = AgeCalculator.age(value);
                                                   age= DateTime.now().year - value.year;
                                                setState(() {
                                                });
                                              });
                                            },
                                            child: SizedBox( child: FittedBox(child: Text('pick a date',style: TextStyle(color: Color(0xfff1fcef)),)))),
                                      ),
                                    ),

                                  age==-1?Text("You Didnt Pick a date" ):  Text("Your Age is: $age"),
                                    Text("Your Age is: $duration")
         
      ],)
      
    );

  
  }
  
}