import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:teste/constants/appBarCustom.dart';

import 'package:teste/Screens/InfUsers.dart';
import 'package:teste/Screens/ShowDrawings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'teste',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: CustomAppBar(),
        primarySwatch: Colors.blue,
      ),

      home: const MyHomePage(title: 'Ola! :)      Hora:'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? _dateFormatted;
  
  
  @override
  Widget build(BuildContext context) {

    setState(() {
      _dateFormatted = DateFormat.Hm().format(DateTime.now());
    });
    

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title+_dateFormatted.toString() , style: const TextStyle(color: Colors.white),),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("Teste users -->",style: TextStyle(fontSize: 15),),

                SizedBox(width: 5),

                ElevatedButton(
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InfUsers()),);
                  },

                  child: const Text("Ver users"), ),



              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                Text("Módulo Desenhos -->",style: TextStyle(fontSize: 15),),

                SizedBox(width: 5),

                ElevatedButton(
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ShowDrawings()),);
                  },

                  child: const Text("Ver Desenhos"), ),



              ],
            ),




          ],
        ),
      ),
    );


  }
  
}

