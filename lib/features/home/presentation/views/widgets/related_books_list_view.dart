import 'package:booky/features/home/presentation/views/widgets/related_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/related_books_cubit/related_books_cubit.dart';
import '../../controller/related_books_cubit/related_books_state.dart';


class RelatedBooksListView extends StatelessWidget {
  const RelatedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksCubit, RelatedBooksStates>(
      builder: (context, state) {
        var relatedBooks =
            BlocProvider.of<RelatedBooksCubit>(context).relatedBooks;
        return Padding(
          padding: const EdgeInsets.only(left: 30, top: 16),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RelatedBookItem(
                  relatedBookModel: relatedBooks[index],
                );
              },
              itemCount: relatedBooks.length,
            ),
          ),
        );
      },
    );
  }
}
