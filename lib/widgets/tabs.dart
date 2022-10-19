import 'package:flutter/material.dart';


class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.red,
      isScrollable: true,
      labelStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      tabs: [
        Tab(
          text: "Popular",
        ),
        Tab(
          text: "New",
        ),
        Tab(
          text: "Upcoming",
        ),
      ],
    );
  }
}
