import 'package:booky/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //   clipBehavior: Clip.antiAlias,
      //  height: MediaQuery.of(context).size.height * 0.27,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            testImage,
          ),
        ),
      ),
    );
  }
}
