import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spently/core/di/dependency_injection.dart';
import 'package:spently/core/router/routes.dart';
import 'package:spently/features/account/presentation/bloc/account_bloc.dart';
import 'package:spently/features/account/presentation/bloc/account_event.dart';
import 'package:spently/features/category/presentation/bloc/category_bloc.dart';
import 'package:spently/features/category/presentation/bloc/category_event.dart';
import 'package:spently/features/home/presentation/pages/home_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => _buildNoTransitionPage(
          context,
          state,
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<AccountBloc>()
                  ..add(SeedDefaultAccountEvent())
                  ..add(LoadAccountsEvent()),
              ),
              BlocProvider(
                create: (context) => sl<CategoryBloc>()
                  // ..add(SeedDefaultCategoriesEvent())
                  ..add(LoadCategoriesEvent()),
              ),
            ],
            child: const HomePage(),
          ),
        ),
      ),
    ],
  );

  static NoTransitionPage<void> _buildNoTransitionPage(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) => NoTransitionPage<void>(key: state.pageKey, child: child);
}
