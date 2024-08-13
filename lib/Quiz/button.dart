import 'package:flutter/material.dart';

class answerButtons extends StatelessWidget {
  const answerButtons(
      {super.key, required this.answerText, required this.onTap});
  final answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          onPressed: onTap,
          child: Text(
            answerText,
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
