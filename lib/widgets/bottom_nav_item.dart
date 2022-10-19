import 'package:flutter/material.dart';



class BottomNavItem extends StatelessWidget {
  BottomNavItem({
    Key? key,
    this.isSelected,
    @required this.icon,
  }) : super(key: key);

  final IconData? icon;
  bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected == true ? Colors.red.shade300 : Colors.transparent,
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(top: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Icon(
        icon,
        // color: ,
      ),
    );
  }
}
