import 'package:booky/core/manager/styles.dart';
import 'package:booky/core/models/book_model.dart';
import 'package:booky/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'book_rating.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/$bookDetailsViewPath',
          extra: bookModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              clipBehavior: Clip.antiAlias,
              height: bookModel.volumeInfo!.authors!.length >= 2 ? 150 : 120,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                bookModel.volumeInfo?.imageLinks?.thumbnail ?? nullImage,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        top: 0,
                        bottom: 2,
                      ),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        bookModel.volumeInfo?.title ?? 'Null',
                        style: textStyle20,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1.5),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: bookModel.volumeInfo!.authors!.length >= 3
                            ? 3
                            : bookModel.volumeInfo?.authors?.length,
                        itemBuilder: (context, index) {
                          return Opacity(
                            opacity: 0.7,
                            child: Text(
                              bookModel.volumeInfo?.authors?[index] ?? 'null',
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Free',
                            style: textStyle20.copyWith(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          BookRating(bookModel: bookModel),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
