import 'package:flutter/material.dart';
import 'package:movieWorld/views/profilePage.dart';
import 'package:movieWorld/views/search_page.dart';


import '../widgets/bottomnavbar.dart';
import '../widgets/filters.dart';
import '../widgets/movies_list.dart';
import '../widgets/tabs.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  int index;
  HomePage(@required this.index);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: widget.index == 0 ? Size.fromHeight(50) : widget.index == 1 ? Size.fromHeight(50) : Size.fromHeight(0),
            child: Align(
              alignment: Alignment.center,
              child: widget.index == 0 ? Tabs() : widget.index == 1 ? Tabs() : null,
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
                child: widget.index == 0
                    ? Column(
                        children: [
                          Filters(),
                          MoviesList(),
                        ],
                      )
                    : widget.index == 1
                        ? Column(
                            children: [
                              // Filters(),
                              // MoviesList(),
                            ],
                          )
                        : Column(
                            children: [
                              Center(child: profilePage()),
                            ],
                          )),
            Container(),
            Container(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(index: widget.index,),
      ),
    );
  }
}
