import 'package:booky/core/app_router.dart';
import 'package:booky/core/utils/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookyApp());
}

class BookyApp extends StatelessWidget {
  const BookyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
       routerConfig: AppRouter.router,
      ),
    );
  }
}
