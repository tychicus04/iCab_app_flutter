import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 52,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6)
            ),
            color: Color(0xff3277D8),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ), 
        )
      ), 
    );
  }
}