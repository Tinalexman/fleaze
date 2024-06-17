import 'package:fleaze/core/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialLocation: Pages.home.path,
      routes: Pages.appRoutes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => MaterialApp.router(
        title: 'Fleaze',
        routerConfig: router,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
      ),
      minTextAdapt: true,
      ensureScreenSize: true,
      designSize: const Size(390, 800),
      splitScreenMode: false,
    );
  }
}
