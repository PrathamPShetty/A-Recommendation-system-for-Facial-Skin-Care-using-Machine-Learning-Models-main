import 'package:farm_link_ai/ui/Customer/about/page.dart';
import 'package:farm_link_ai/ui/Customer/contact/page.dart';
import 'package:farm_link_ai/ui/Customer/home/page.dart';
import 'package:farm_link_ai/ui/Customer/product/page.dart';
import 'package:farm_link_ai/ui/SplashScreen/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),

        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) =>
              const Home(), // Default view for 'customer'
          routes: [
            GoRoute(
              path: 'about',
              builder: (BuildContext context, GoRouterState state) =>
                  const About(),
            ),
            GoRoute(
              path: 'about',
              builder: (BuildContext context, GoRouterState state) =>
                  const About(),
            ),

        ]
        ),
        ),
  ]

);
