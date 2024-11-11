import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.onTap,
    required this.categoryTitle,
  });
  final String image;
  final String categoryTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            //   clipBehavior: Clip.antiAlias,
            height: MediaQuery.of(context).size.height *
                0.20, // this is for showing the image in the column
            margin: const EdgeInsets.symmetric(horizontal: 7),
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          categoryTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
