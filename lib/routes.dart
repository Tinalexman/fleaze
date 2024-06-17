import 'package:fleaze/features/home/home.dart';
import 'package:go_router/go_router.dart';

import 'package:fleaze/core/index.dart' show StringExtension;

class Pages {
  static String get splash => "splash";
  static String get home => "home";

  static List<GoRoute> get appRoutes => [
    GoRoute(
      path: Pages.home.path,
      name: Pages.home,
      builder: (_, __) => const Homepage(),
    ),
  ];
}



