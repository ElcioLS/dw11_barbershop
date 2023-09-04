import 'package:dw11_barbershop/src/core/fp/either.dart';
import 'package:dw11_barbershop/src/core/provider/application_providers.dart';
import 'package:dw11_barbershop/src/model/schedule_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_schedule_vm.g.dart';

@riverpod
class EmployeeScheduleVm extends _$EmployeeScheduleVm {
  @override
  Future<List<ScheduleModel>> build(int userId, DateTime date) async {
    final repository = ref.read(scheduleRepositoryProvider);
    final scheduleListResult =
        await repository.findScheduleyByDate((userId: userId, date: date));

    return switch (scheduleListResult) {
      Success(value: final schedules) => schedules,
      Failure(:final exception) => throw Exception(exception),
    };
    return [];
  }
}