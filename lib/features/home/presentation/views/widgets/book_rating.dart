
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 7,
        ),
        const Text(
          '4.5',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '(2390)',
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}