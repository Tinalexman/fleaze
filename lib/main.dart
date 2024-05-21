import 'package:fleaze/misc/constants.dart';
import 'package:fleaze/misc/routes.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();

  runApp(const ProviderScope(child: FleazeApp()));
}

class FleazeApp extends ConsumerStatefulWidget {
  const FleazeApp({super.key});

  @override
  ConsumerState<FleazeApp> createState() => _FleazeAppState();
}

class _FleazeAppState extends ConsumerState<FleazeApp> {

  late GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(
      initialLocation: Pages.splash,
      routes: routes,
    );
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => MaterialApp.router(
        title: 'Fleaze',
        routerConfig: router,
        theme: FlexColorScheme.light(
            scheme: FlexScheme.ebonyClay
        ).toTheme,
        darkTheme: FlexColorScheme.dark(
            scheme: FlexScheme.ebonyClay
        ).toTheme,
      ),
      minTextAdapt: true,
      ensureScreenSize: true,
      designSize: const Size(390, 800),
      splitScreenMode: false,
    );
  }

}

