import 'package:booky/core/utils/utils.dart';
import 'package:booky/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/home_cubit/cubit.dart';
import '../../controller/home_cubit/states.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder : (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem(
                categoryTitle: categoriesTitles[index],
                image: categoriesImages[index],
                onTap: () {
                  if (index == 0) {
                    cubit.fetchBooksByCategory(categoryTitle: 'programming');
                  } else if (index == 1) {
                    cubit.fetchBooksByCategory(categoryTitle: 'science');
                  } else if (index == 2) {
                    cubit.fetchBooksByCategory(categoryTitle: 'business');
                  } else if (index == 3) {
                    cubit.fetchBooksByCategory(categoryTitle: 'history');
                  } else if (index == 4) {
                    cubit.fetchBooksByCategory(categoryTitle: 'cooking');
                  }
                },
              );
            },
            itemCount: categoriesTitles.length,
          ),
        );
      },
    );
  }
}
