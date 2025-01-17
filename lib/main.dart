import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'utils/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: get<RootStackRouter>().config(),
    );
  }
}
