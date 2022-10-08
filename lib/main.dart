import 'package:flutter/material.dart';

import 'pages/randomwords.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(         
      title: 'Startup Name Generator',
      theme: ThemeData(          
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ), 
      home:const RandomWords(),
      debugShowCheckedModeBanner: false,
    );
}
}
