import 'package:farm_link_ai/ui/Customer/about/page.dart';
import 'package:farm_link_ai/ui/Customer/contact/page.dart';
import 'package:farm_link_ai/ui/Customer/home/page.dart';
import 'package:farm_link_ai/ui/Customer/product/page.dart';
import 'package:farm_link_ai/ui/SplashScreen/page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_link_ai/ui/Customer/recommedation/page.dart';


final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/recommendation',
      builder: (BuildContext context, GoRouterState state) =>
      const SplashScreen(),
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
          const Home(),
        ),
        GoRoute(
          path: 'about',
          builder: (BuildContext context, GoRouterState state) =>
          const About(),
        ),
        GoRoute(
          path: 'contact',
          builder: (BuildContext context, GoRouterState state) =>
          const Contact(),
        ),
        GoRoute(
          path: 'recommendation',
          builder: (BuildContext context, GoRouterState state) =>
          const CameraPage(),
        ),
        GoRoute(
          path: 'product',
          builder: (BuildContext context, GoRouterState state) =>
          const CustomerProduct(),
        ),
      ],
    ),
  ],
);
