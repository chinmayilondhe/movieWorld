import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieWorld/views/home_page.dart';
import 'package:movieWorld/views/movie_description.dart';
import 'package:movieWorld/views/search_page.dart';
import 'package:movieWorld/views/splashScreen.dart';

import 'models/search_bloc/search_bloc.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      )),
      home: const splashScreen(),
      // initialRoute: HomePage.id,
      routes: <String, WidgetBuilder>{
        HomePage.id: (context) => HomePage(),
        MovieDescription.id: (context) => MovieDescription(),
        SearchPage.id: (context) => BlocProvider(
              create: (context) => SearchBloc()..add(SearchTrigger()),
              child:  SearchPage(),
            ),
      },
    );
  }
}