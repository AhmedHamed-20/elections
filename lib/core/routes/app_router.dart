import 'package:elections/core/routes/app_routes_names.dart';
import 'package:elections/core/services/service_locator.dart';
import 'package:elections/features/elections/view/screens/elections_screen.dart';
import 'package:elections/features/elections/view_model/elections_cubit.dart';
import 'package:elections/features/registrations/view/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generatRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutesNames.registrations:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case AppRoutesNames.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => serviceLocator<ElectionsCubit>(),
                child: const ElectionsScreen()));
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
