import 'package:farm_link_ai/ui/Customer/about/page.dart';
import 'package:farm_link_ai/ui/Customer/contact/page.dart';
import 'package:farm_link_ai/ui/Customer/home/page.dart';
import 'package:farm_link_ai/ui/Customer/product/page.dart';
import 'package:farm_link_ai/ui/SplashScreen/page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_link_ai/ui/Customer/recommedation/page.dart';
import 'package:farm_link_ai/ui/Customer/resultpage/page.dart';
import 'package:farm_link_ai/ui/Customer/help/page.dart';
import 'package:farm_link_ai/ui/Customer/setting.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Home(),
      routes: [
        GoRoute(
          path: 'welcome',
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: 'about',
          builder: (BuildContext context, GoRouterState state) => const About(),
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
            routes: [
              GoRoute(
                path: '/display',
                builder: (BuildContext context, GoRouterState state) {
                  final skinType = state.uri.queryParameters['skinType'] ?? '';
                  final acneType = state.uri.queryParameters['acneType'] ?? '';
                  return ResultPage(skinType: skinType, acneType: acneType);
                },
              ),
            ]),
        GoRoute(
          path: 'product',
          builder: (BuildContext context, GoRouterState state) =>
              const CustomerProduct(),
        ),  GoRoute(
          path: 'help',
          builder: (BuildContext context, GoRouterState state) =>
              const Help(),
        ), GoRoute(
          path: 'setting',
          builder: (BuildContext context, GoRouterState state) =>
              Setting(),
        ),
      ],
    ),
  ],
);
