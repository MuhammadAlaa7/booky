import 'package:booky/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:booky/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [
          HomeAppBar(),
          CategoriesListView(),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Newest Books',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          NewestBooksListView(),
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
