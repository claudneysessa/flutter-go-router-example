import 'package:flutter/material.dart';
import 'package:spallawebapp/common/routes/app_routes.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp.router(
      title: 'Spalla Web App',
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
