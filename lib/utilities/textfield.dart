import 'package:flutter/material.dart';

class TField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  const TField({super.key,
    required this.controller,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: controller,
              maxLength: 8,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                prefixIcon: Icon(icon,color: Colors.white,),
              ),
            );
  }
}