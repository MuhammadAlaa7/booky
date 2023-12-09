import 'package:booky/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/$bookDetailsViewPath',
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
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                testImage,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      top: 16,
                      bottom: 2,
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      'Here is the title of the book so long ',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
                    child: Opacity(
                        opacity: 0.7,
                        child: Text(
                          'Book Author',
                        )),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                        ),
                        BookRating(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          '4.5',
          style: TextStyle(),
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