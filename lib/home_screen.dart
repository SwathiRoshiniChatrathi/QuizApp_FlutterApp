import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 24,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 2),
            ),
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            label: const Text(
              "Start Quiz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

// Can also be done like this for icon button
// OutlinedButton(
// onPressed: () {},
// style: OutlinedButton.styleFrom(
// side: const BorderSide(color: Colors.white, width: 2)),
// child: const Row(mainAxisSize: MainAxisSize.min, children: [
// Icon(
// Icons.play_arrow,
// color: Colors.white,
// ),
// SizedBox(
// width: 8,
// ),
// Text(
// "Start Quiz",
// style: TextStyle(
// color: Colors.white,
// fontSize: 24,
// fontWeight: FontWeight.w500),
// )
// ]),
// ),

//Adding opacity to an image can be done like this
// Opacity(
// opacity: 0.5,
// child: Image.asset("assets/images/quiz-logo.png"),
// ),
