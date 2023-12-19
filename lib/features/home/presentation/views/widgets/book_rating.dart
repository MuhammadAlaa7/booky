import 'package:booky/core/manager/styles.dart';
import 'package:booky/core/models/book_model.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Icon(
Icons.star_rounded ,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          bookModel.volumeInfo?.averageRating?.toString() ?? '0',
          style: textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            '( ${bookModel.volumeInfo?.ratingsCount?.toString() ?? '0'} )',
            style: textStyle14,
          ),
        ),
      ],
    );
  }
}
