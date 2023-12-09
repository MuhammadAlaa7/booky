import 'package:booky/core/utils/utils.dart';
import 'package:booky/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import 'widgets/details_app_bar.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          DetailsAppBar(),
          DetailsImage(),
          BookMainInfo(),
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
        cacheHeight: 300,
        cacheWidth: 250,
      ),
    );
  }
}

class BookMainInfo extends StatelessWidget {
  const BookMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,) ,
        const Text(
          'The Title of The Book',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10,) ,
        Text(
          'Book Author',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.7)),
        ),
        const SizedBox(height: 10,) ,
        const BookRating(),
      ],
    );
  }
}
