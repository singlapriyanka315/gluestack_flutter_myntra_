import 'package:myntra_clone/myntra_export.dart';

final GoRouter router = GoRouter(
  // initialLocation:  '/productDetails',
   initialLocation:  '/',
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
    GoRoute(
      path: '/productDetails',
      builder: (context, state) =>
          const HomeScreen(childScreen: ProductDetailScreen()),
    ),
  ],
);
