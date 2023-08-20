import 'package:asyncstate/asyncstate.dart';
import 'package:dw11_barbershop/src/core/exceptions/service_exception.dart';
import 'package:dw11_barbershop/src/core/fp/either.dart';
import 'package:dw11_barbershop/src/core/provider/application_providers.dart';
import 'package:dw11_barbershop/src/features/splash/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    final loaderHandle = AsyncLoaderHandler()..start();

    final loginService = ref.watch(userLoginServiceProvider);

    final result = await loginService.execute(email, password);

    switch (result) {
      case Success():
        //buscar usuários
        break;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
    }

    loaderHandle.close();
  }
}
