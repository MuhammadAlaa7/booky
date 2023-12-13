import 'package:booky/core/app_router.dart';
import 'package:booky/core/utils/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BooklyApp()); //hello
}

//test commit
class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryColor,
            // primaryTextTheme: Typography().white,
            textTheme: Typography().white,
            iconTheme: const IconThemeData(
              color: Colors.white,
            )),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
// TODO: SFAFASFLSDKFJALSKFJLKSA;FJSLKF
// TODO: ASDF;LJSDF;LJ

// ! BECAREFUL
// ? HERE ARE THE MOST 
// TODO: SDFASFD
// todo: sadfjsa;fdlkjsalk;fj
// TODO: ASD;FJSA;DLFJASL;FJ
// * Important information is here 



