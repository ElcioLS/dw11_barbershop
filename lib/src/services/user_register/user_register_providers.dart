import 'package:dw11_barbershop/src/core/provider/application_providers.dart';
import 'package:dw11_barbershop/src/services/user_register/user_register_adm_service.dart';
import 'package:dw11_barbershop/src/services/user_register/user_register_adm_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_register_providers.g.dart';

@Riverpod(keepAlive: true)
UserRegisterAdmService userRegisterAdmService(UserRegisterAdmServiceRef ref) =>
    UserRegisterAdmServiceImpl(
      userRepository: ref.watch(userRepositoryProvider),
      userLoginService: ref.watch(userLoginServiceProvider),
    );
