import 'package:booky/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class SearchedBookListView extends StatelessWidget {
  const SearchedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 50,
      ),
      child: ListView.builder(
        // YOU MUST MAKE IT SHRINK BECAUSE IT BECAME A UNIT

        itemBuilder: (context, index) {
          return const BookItem();
        },
        itemCount: 20,
      ),
    );
  }
}
