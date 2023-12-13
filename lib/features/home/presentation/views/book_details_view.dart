import 'package:booky/core/manager/styles.dart';
import 'package:booky/core/utils/utils.dart';
import 'package:booky/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import 'widgets/details_app_bar.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DetailsAppBar(),
          const Center(
            child: DetailsImage(),
          ),
          const BookMainInfo(),
          const PreviewButton(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Text(
              'you can also like ',
              style: textStyle14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SimilarBooksListView(),
        ],
      ),
    );
  }
}

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        testImage,
        cacheHeight: 250,
        cacheWidth: 220,
      ),
    );
  }
}

class BookMainInfo extends StatelessWidget {
  const BookMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          'The Title of The Book',
          style: textStyle30,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Book Author',
            style: textStyle18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        BookRating(),
      ],
    );
  }
}

class PreviewButton extends StatelessWidget {
  const PreviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.white,
                // side: BorderSide(color: Colors.yellow, width: 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Free',
                style: textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xffEF8262),
                // side: BorderSide(color: Colors.yellow, width: 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Preview',
                style: textStyle18.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 16),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const SimilarBookItem();
          },
          itemCount: 5,
        ),
      ),
    );
  }
}

// this is the similar books
class SimilarBookItem extends StatelessWidget {
  const SimilarBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
      ),
      clipBehavior: Clip.antiAlias,
      //height: ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        testImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
