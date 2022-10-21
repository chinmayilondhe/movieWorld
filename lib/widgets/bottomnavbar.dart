import 'package:flutter/material.dart';
import 'package:movieWorld/views/home_page.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatefulWidget {
  int index;
  BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // late int index;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              widget.index = value;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(value)));
              print(value);
            });
            // print(index);
          },
          //  unselectedItemColor: Colors.transparent,
          currentIndex: widget.index,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: BottomNavItem(
                icon: Icons.home,
                isSelected: widget.index == 0,
              ),
            ),
            BottomNavigationBarItem(
              icon: BottomNavItem(
                icon: Icons.bookmark,
                isSelected: widget.index == 1,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: BottomNavItem(
                icon: Icons.person,
                isSelected: widget.index == 2,
              ),
              label: "",
            )
          ]),
    );
  }
}
