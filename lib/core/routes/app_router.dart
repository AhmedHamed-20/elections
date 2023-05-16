import 'package:elections/core/routes/app_routes_names.dart';
import 'package:elections/features/elections/view/screens/elections_screen.dart';
import 'package:elections/features/registrations/view/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generatRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutesNames.registrations:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case AppRoutesNames.home:
        return MaterialPageRoute(builder: (_) => const ElectionsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
