import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/screens/course_page.dart';
import 'package:restaurant_app/screens/food_detail_page.dart';
import 'package:restaurant_app/screens/home_page.dart';

import 'cubit/app_cubit.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'foodDetail',
          builder: (BuildContext context, GoRouterState state) {
            return const FoodDetailPage();
          },
        ),
        GoRoute(
          path: 'course',
          builder: (BuildContext context, GoRouterState state) {
            return const CoursePage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp.router(
        routerConfig: _router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
