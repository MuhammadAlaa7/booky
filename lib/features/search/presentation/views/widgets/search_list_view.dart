import 'package:booky/core/models/book_model.dart';
import 'package:booky/features/home/presentation/views/widgets/book_item.dart';
import 'package:booky/features/search/presentation/controller/search_cubit/search_cubit.dart';
import 'package:booky/features/search/presentation/controller/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedBookListView extends StatelessWidget {
  const SearchedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        List<BookModel> searchedBooks =
            BlocProvider.of<SearchCubit>(context).searchedBooks;
        if (state is SearchFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is SearchSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 50,
            ),
            
            child: ListView.builder(
              // YOU MUST MAKE IT SHRINK BECAUSE IT BECAME A UNIT

              itemBuilder: (context, index) {
                return BookItem(
                  bookModel: searchedBooks[index],
                );
              },
              itemCount: searchedBooks.length,
            ),
          );
        } else if (state is SearchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text(
              'Searched Books Appear Here',
              style: TextStyle(fontSize: 25, fontFamily: 'GT Sectra'),
            ),
          );
        }
      },
    );
  }
}
