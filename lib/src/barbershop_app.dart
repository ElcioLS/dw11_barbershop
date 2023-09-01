import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dw11_barbershop/src/core/ui/barbershop_nav_global_key.dart';
import 'package:dw11_barbershop/src/core/ui/barbershop_theme.dart';
import 'package:dw11_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw11_barbershop/src/features/employee/register/employee_register_page.dart';
import 'package:dw11_barbershop/src/features/home/adm/home_adm_page.dart';
import 'package:dw11_barbershop/src/features/schedule/schedule_page.dart';
import 'package:dw11_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'features/auth/login/login_page.dart';
import 'features/register/barbershop_register_page.dart';
import 'features/register/user/user_register_page.dart';

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
          navigatorKey: BarbershopNavGlobalKey.instance.navkey,
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/auth/register/barbershop': (_) => const BarbershopRegisterPage(),
            '/home/adm': (_) => const HomeAdmPage(),
            '/home/employee': (_) => const Text('Employee'),
            '/employee/register': (_) => const EmployeeRegisterPage(),
            '/schedule': (_) => const SchedulePage(),
          },
        );
      },
    );
  }
}
