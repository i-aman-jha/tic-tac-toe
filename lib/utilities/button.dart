import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final double size;
  final IconData icon;
  final VoidCallback onTap;
  const Button({super.key,
    required this.text,
    required this.size,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepOrangeAccent,
                  Colors.orangeAccent,
                  Colors.amber
                ]),
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: size,
              ),
              Text(text,
                style: GoogleFonts.bungeeHairline(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: size,
                      fontWeight: FontWeight.w900),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
