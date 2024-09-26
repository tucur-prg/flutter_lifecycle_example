import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/home.dart';

void main() {
  print("LOGGING: main()");

  runApp(const MyApp());
}

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'initial',
      pageBuilder: (context, state) {
        print("LOGGING: GoRoute(initial)");
        return MaterialPage(
          key: state.pageKey,
          child: const MyHomePage(title: 'Flutter Demo Initial Page'),
        );
      }
    ),

    GoRoute(
      path: '/details',
      name: 'details',
      pageBuilder: (context, state) {
        print("LOGGING: GoRoute(details)");
        return MaterialPage(
          key: state.pageKey,
          child: const MyHomePage(title: 'Flutter Demo Details Page'),
        );
      }
    ),

    GoRoute(
      path: '/app/link',
      name: 'universal_links',
      pageBuilder: (context, state) {
        print("LOGGING: GoRoute(universal_links)");
        return MaterialPage(
          key: state.pageKey,
          child: const MyHomePage(title: 'Flutter Demo UniversalLinks Page'),
        );
      }
    ),
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("LOGGING: MyApp.build()");

    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
