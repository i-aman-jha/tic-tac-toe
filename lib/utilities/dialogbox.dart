import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/pages/game.dart';
import 'package:tic_tac_toe/utilities/textfield.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller1=TextEditingController();
    TextEditingController controller2=TextEditingController();

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
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
        borderRadius: BorderRadius.circular(20),
      ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TField(controller: controller1, hint: "Player 1",icon: Icons.close,),
            const SizedBox(height: 20),
            TField(controller: controller2, hint: "Player 2",icon: Icons.circle_outlined,),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  splashColor: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Game(
                        player1: (controller1.text.isNotEmpty)?controller1.text:"Player 1", 
                        player2: (controller2.text.isNotEmpty)?controller2.text:"Player 2")),
                    );
                  },
                  child: Text("OK",
                    style: GoogleFonts.bungeeHairline(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                  ), 
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
