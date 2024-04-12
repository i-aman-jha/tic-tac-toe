import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int row;
  final int col;
  final Function(int, int) onTap;
  final Function(int, int) icon;
  const Tile({super.key,
    required this.row,
    required this.col,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(row,col);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ), 
        child: Icon((icon(row,col)!=Icons.question_mark)?icon(row,col):null,color: Colors.white,size: MediaQuery.of(context).size.width * 0.2,),
      ),
    );
  }
}

