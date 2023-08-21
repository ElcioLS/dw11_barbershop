import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dw11_barbershop/src/core/ui/barbershop_theme.dart';
import 'package:dw11_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw11_barbershop/src/features/splash/auth/login/login_page.dart';
import 'package:dw11_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dart Week 2023',
          theme: BarbershopTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/home/adm': (_) => const Text('ADM'),
            '/home/employee': (_) => const Text('Employee'),
          },
        );
      },
    );
  }
}
