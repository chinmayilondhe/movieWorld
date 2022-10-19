import 'package:flutter/material.dart';

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
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.red,
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
