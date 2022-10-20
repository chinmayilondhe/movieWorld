import 'package:flutter/material.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              index = value;
            });
            // print(index);
          },
          //  unselectedItemColor: Colors.transparent,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: BottomNavItem(
                icon: Icons.home,
                isSelected: index == 0,
              ),
            ),
            BottomNavigationBarItem(
              icon: BottomNavItem(
                icon: Icons.bookmark,
                isSelected: index == 1,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: BottomNavItem(
                icon: Icons.person,
                isSelected: index == 2,
              ),
              label: "",
            )
          ]),
    );
  }
}
