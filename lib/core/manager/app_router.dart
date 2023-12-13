import 'package:booky/core/utils/utils.dart';
import 'package:booky/features/home/presentation/views/home_view.dart';
import 'package:booky/features/search/presentation/views/search_view.dart';
import 'package:booky/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/book_details_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: homeViewPath,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
          GoRoute(
            path: bookDetailsViewPath,
            builder: (BuildContext context, GoRouterState state) {
              return const BookDetailsView();
            },
          ),
          GoRoute(
            path: searchViewPath,
            builder: (BuildContext context, GoRouterState state) {
              return const SearchView();
            },
          ),
        ],
      ),
    ],
  );
}
