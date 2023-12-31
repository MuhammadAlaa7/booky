import 'package:booky/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:booky/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:booky/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:booky/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const HomeAppBar(),
          const CategoriesListView(),
          const SizedBox(
            height: 20,
          ),
         
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              var cubit = BlocProvider.of<HomeCubit>(context);
              if (state is HomeFailureState) {
                return Text(state.errorMessage);
              } else if (state is HomeSuccessState) {
                return NewestBooksListView(books: state.booksss, listTitle: '',);        
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

/*

The Idea of Displaying  Two ListViews in One ListView in the Same Screen

>>> put the first list view in a height 
>>> make the second list view : 1- never scroll   2- SHRINKWRAP = TRUE 
3- don't make it expanded , because you don't need it anymore because it 
is considered now as a unit not list 

*/
