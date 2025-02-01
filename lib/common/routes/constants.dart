import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:spallawebapp/common/pages/not_found/not_found_page.dart';

class Routes {
  static const root = '/';
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';
  //static profileNamedPage([String? name]) => '/${name ?? ':profile'}';

  static Widget errorWidget(BuildContext context, GoRouterState state) {
    return const NotFoundScreen();
  }
}
