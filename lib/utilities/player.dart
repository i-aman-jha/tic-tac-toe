import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerName extends StatelessWidget {
  final String name;
  final String sign;
  final bool isActive;
  const PlayerName({
    super.key,
    required this.name,
    required this.sign,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.44,
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
          color: (isActive)?Colors.white:Colors.transparent,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Icon(
                Icons.person,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 0.09,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(name,
                    style: GoogleFonts.bungeeHairline(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.44*0.13,
                          fontWeight: FontWeight.w900),
                    )),
              ),
            ],
          ),
          (sign == "circle")
              ? const Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
        ],
      ),
    );
  }
}
