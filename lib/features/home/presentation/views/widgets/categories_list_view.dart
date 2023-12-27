import 'package:booky/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/utils.dart';
import '../../controller/home_cubit/home_cubit.dart';
import '../../controller/home_cubit/home_states.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    cubit.changeNewestListTitle(0);
                  } else if (index == 1) {
                    cubit.fetchBooksByCategory(categoryTitle: 'science');
                    cubit.changeNewestListTitle(1);
                  } else if (index == 2) {
                    cubit.fetchBooksByCategory(categoryTitle: 'business');
                    cubit.changeNewestListTitle(2);
                  } else if (index == 3) {
                    cubit.fetchBooksByCategory(categoryTitle: 'history');
                    cubit.changeNewestListTitle(3);
                  } else if (index == 4) {
                    cubit.fetchBooksByCategory(categoryTitle: 'cooking');
                    cubit.changeNewestListTitle(4);
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
