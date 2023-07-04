import 'package:ethio_tour/components/bottom_nav_bar.dart';
import 'package:ethio_tour/config/colors.dart';
import 'package:ethio_tour/screen/account_setup.dart';
import 'package:ethio_tour/screen/homepage.dart';
import 'package:ethio_tour/screen/login.dart';
import 'package:ethio_tour/screen/intro.dart';
import 'package:ethio_tour/screen/place_details.dart';
import 'package:ethio_tour/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const IntroPage(),
  ),
  GoRoute(
    path: '/intro2',
    builder: (context, state) => const Intro2(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(
    path: '/account-setup',
    builder: (context, state) => const AccountSetupPage(),
  ),
  ShellRoute(
    builder: (context, state, child) => Scaffold(
      backgroundColor: KPrimary.shade800,
      body: child,
      bottomNavigationBar: const BottomNavBar(),
    ),
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/place-details/:id',
        builder: (context, state) => PlaceDetails(
          id: int.parse(
            state.pathParameters['id']!,
          ),
        ),
      )
    ],
  ),
]);
