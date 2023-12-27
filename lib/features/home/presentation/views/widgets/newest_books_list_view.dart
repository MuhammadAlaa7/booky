import 'package:booky/core/manager/styles.dart';
import 'package:booky/core/models/book_model.dart';
import 'package:booky/core/utils/utils.dart';
import 'package:booky/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:booky/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
    required this.books,
    required this.listTitle,

  });
  final List<BookModel> books;
  final String listTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
           BlocProvider.of<HomeCubit>(context).listTitle ,
            style: textStyle18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 50,
          ),
          child: ListView.builder(
            // YOU MUST MAKE IT SHRINK BECAUSE IT BECAME A UNIT
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BookItem(
                bookModel: books[index],
              );
            },
            itemCount: books.length,
          ),
        ),
      ],
    );
  }
}
