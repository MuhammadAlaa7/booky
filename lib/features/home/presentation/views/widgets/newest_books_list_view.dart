import 'package:booky/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 50,
      ),
      child: ListView.builder(
        // YOU MUST MAKE IT SHRINK BECAUSE IT BECAME A UNIT
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const BookItem();
        },
        itemCount: 20,
      ),
    );
  }
}
