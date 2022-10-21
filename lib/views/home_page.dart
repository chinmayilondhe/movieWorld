import 'package:flutter/material.dart';
import 'package:movieWorld/views/search_page.dart';

import '../widgets/bottomnavbar.dart';
import '../widgets/filters.dart';
import '../widgets/movies_list.dart';
import '../widgets/tabs.dart';

class HomePage extends StatelessWidget {
  static const String id = "home_page";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            "India",
            style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Tabs(),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.red,
                onPressed:(){
                  Navigator.of(context).pushNamed(SearchPage.id);
                }
              ),
            )
          ],
        ),
        body: TabBarView(
          physics: ClampingScrollPhysics(),
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Filters(),
                  MoviesList(),
                ],
              ),
            ),
            Container(),
            Container(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
