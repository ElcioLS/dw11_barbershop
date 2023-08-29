import 'package:asyncstate/asyncstate.dart';
import 'package:dw11_barbershop/src/core/provider/application_providers.dart';
import 'package:dw11_barbershop/src/features/home/adm/home_adm_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_adm_vm.g.dart';

@riverpod
class HomeAdmVm extends _$HomeAdmVm {
  @override
  Future<HomeAdmState> build() async {
    return HomeAdmState(
      status: HomeAdmStateStatus.loaded,
      employees: [],
    );
  }

  Future<void> logout() => ref.read(logoutProvider.future).asyncLoader();
}
