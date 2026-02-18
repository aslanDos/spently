import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spently/core/router/routes.dart';
import 'package:spently/features/home/presentation/pages/home_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) =>
            _buildNoTransitionPage(context, state, const HomePage()),
      ),
    ],
  );

  static NoTransitionPage<void> _buildNoTransitionPage(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) => NoTransitionPage<void>(key: state.pageKey, child: child);
}
