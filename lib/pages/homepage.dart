import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/utilities/dialogbox.dart';
import 'package:tic_tac_toe/utilities/button.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //to avoid bottom shifting up with keyboard
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover,
                    opacity: 0.5)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tic Tac Toe",
                    style: GoogleFonts.bungeeSpice(
                        textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.15,
                    )),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              const Image(image: AssetImage('assets/images/img.png')),
              const Expanded(child: SizedBox()),
              Button(
                text: "Play",
                size:50,
                icon: Icons.play_arrow,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const DialogBox();
                    },
                  );
                },
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
