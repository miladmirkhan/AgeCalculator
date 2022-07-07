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
        backgroundColor:  Colors.deepPurple,
        centerTitle: true,
        title: Text("Age Calculator",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.black,
      body:Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 1, 1),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
                                Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Text("What is your Birth Date?",style: TextStyle(color: Colors.blueAccent,fontSize: 30, fontWeight: FontWeight.bold,decorationThickness: 20),),
                                ),
                                      SizedBox(
                                          width: 200,
                                          child: FittedBox(
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                    primary: Colors.black,
                                                    backgroundColor: Colors.deepPurple),
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
                                            SizedBox(
                                              height: 40,
                                            ),
                                      age==-1?Text("You Didn't Pick a date",style: TextStyle(color: Colors.blueAccent,fontSize: 20, fontWeight: FontWeight.bold), ):  Text("Your Age is: $age",style: TextStyle(color: Colors.blueAccent,fontSize: 20, fontWeight: FontWeight.bold),),
                                    age==-1?Text(""):  Text("$duration",style: TextStyle(color: Colors.blueAccent,fontSize: 20, fontWeight: FontWeight.bold),)
             
          ],),
        ),
      )
      
    );

  
  }
  
}