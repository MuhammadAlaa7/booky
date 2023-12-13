import 'package:booky/core/manager/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          '4.5',
          style: textStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            '(2390)',
            style: textStyle14,
          ),
        ),
      ],
    );
  }
}
