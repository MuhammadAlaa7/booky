
// this is the similar books
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/book_model.dart';
import '../../../../../core/utils/utils.dart';

class RelatedBookItem extends StatelessWidget {
  const RelatedBookItem({
    super.key,
    required this.relatedBookModel,
  });
  final BookModel relatedBookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacement(
          '/$bookDetailsViewPath',
          extra: relatedBookModel,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 10,
        ),
        clipBehavior: Clip.antiAlias,
        //height: ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          relatedBookModel.volumeInfo?.imageLinks?.thumbnail ?? nullImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
