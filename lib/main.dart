import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieWorld/views/home_page.dart';
import 'package:movieWorld/views/movie_description.dart';
import 'package:movieWorld/views/splashScreen.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.1,
              fontSizeDelta: 1.5,
            ),
          )
      ),
      home: splashScreen(),
      // initialRoute: HomePage.id,
      routes: <String, WidgetBuilder>{
        HomePage.id : (context) => HomePage(0),
        MovieDescription.id: (context) => MovieDescription(),
      },
    );
  }
}
