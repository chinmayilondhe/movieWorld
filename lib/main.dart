import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/views/home_page.dart';
import 'package:movie_app/views/movie_description.dart';

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
      home: HomePage(),
      initialRoute: HomePage.id,
      routes: <String, WidgetBuilder>{
        HomePage.id : (context) => HomePage(),
        MovieDescription.id: (context) => MovieDescription(),
      },
    );
  }
}