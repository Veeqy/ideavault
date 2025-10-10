// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ideavault/core/common_widgets/not_found_screen.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:ideavault/features/ideas/presentation/screens/about_screen.dart';
import 'package:ideavault/features/ideas/presentation/screens/add_edit_idea_screen.dart';
import 'package:ideavault/features/ideas/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundScreen(),
  // errorPageBuilder: (context, state) => MaterialPage(
  //         key: state.pageKey,
  //         child:NotFoundScreen(),),
  routes: [
    GoRoute(
      path: '/',
      name: AppRouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/new-idea',
      name: AppRouteNames.newIdea,
      builder: (context, state) => const AddEditIdeaScreen(),
    ),
    GoRoute(
        path: '/about',
        name: AppRouteNames.about,
        builder: (context, state) => const AboutScreen(),
    ),
  ],
);