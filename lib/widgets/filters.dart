import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  Filters({
    Key? key,
  }) : super(key: key);

  List<String> filters = ["Drama", "Action", "Horror", "Comedy", "Family"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.transparent,
      child: ListView.builder(
          itemCount: filters.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), 
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.shade400,
                offset: Offset(2, 2),
                
                blurRadius: 10,
                )
              ]
              ),
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(filters[index], style: TextStyle(color: Colors.black, letterSpacing: 1.5),),
            );
          }),
    );
  }
}
