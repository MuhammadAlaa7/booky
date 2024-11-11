import 'package:flutter/material.dart';

import '../../../../../core/models/book_model.dart';
import '../../../../../core/utils/utils.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        bookModel.volumeInfo?.imageLinks?.thumbnail ?? nullImage,
        // cacheHeight: 300,
        //  cacheWidth: 220,
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.height * 0.2,

        fit: BoxFit.fill,
      ),
    );
  }
}