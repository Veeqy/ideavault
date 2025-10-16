import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ideavault/core/common_widgets/main_shell.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:ideavault/features/ideas/presentation/screens/add_edit_idea_screen.dart';
import 'package:ideavault/features/ideas/presentation/screens/category_picker_screen.dart';
import 'package:ideavault/features/ideas/presentation/screens/home_screen.dart';
import 'package:ideavault/features/settings/presentation/screens/settings_screen.dart';

// Create a key for the root navigator
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/ideas',
  routes: [
    // This StatefulShellRoute is the root of our app's UI
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // The 'navigationShell' is the controller for the tabs
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        // The first branch, or tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/ideas',
              name: AppRouteNames.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        // The second branch, or tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: AppRouteNames.settings ,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
    // A separate, top-level route for creating/editing ideas
    // This will display OVER the shell route
    GoRoute(
      path: '/idea/:id',
      name: AppRouteNames.editIdea,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return AddEditIdeaScreen(ideaId: id);
      },
    ),
    GoRoute(
      path: '/new-idea',
      name: AppRouteNames.newIdea,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) =>  AddEditIdeaScreen(),
    ),
  GoRoute(
  path: '/picker/category',
  name: AppRouteNames.categoryPicker, // Add 'categoryPicker' to AppRouteNames
  parentNavigatorKey: _rootNavigatorKey,
  builder: (context, state) => const CategoryPickerScreen(),
),
  ],
);