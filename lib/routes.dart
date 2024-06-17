import 'package:fleaze/core/index.dart' show StringExtension;
import 'package:fleaze/features/home/home.dart';
import 'package:fleaze/features/home/search.dart';
import 'package:go_router/go_router.dart';

class Pages {
  static String get home => "home";

  static String get search => "search";

  static List<GoRoute> get appRoutes => [
        GoRoute(
          path: home.path,
          name: home,
          builder: (_, __) => const Homepage(),
        ),
        GoRoute(
          path: search.path,
          name: search,
          builder: (_, __) => const SearchPage(),
        ),
      ];
}
