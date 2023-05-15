import 'package:elections/core/routes/app_routes_names.dart';
import 'package:elections/features/registrations/view/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generatRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutesNames.registrations:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
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
