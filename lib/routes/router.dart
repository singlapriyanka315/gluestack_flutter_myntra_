import 'package:go_router/go_router.dart';
import 'package:myntra_clone/screens/home_screen.dart';
import 'package:myntra_clone/screens/category_screen.dart';

final GoRouter router = GoRouter(
  initialLocation:  '/category',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) =>
          const HomeScreen(childScreen: CategoryScreen()),
    ),
  ],
);
