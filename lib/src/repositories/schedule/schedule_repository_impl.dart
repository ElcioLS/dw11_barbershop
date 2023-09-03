import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw11_barbershop/src/core/exceptions/repository_exception.dart';
import 'package:dw11_barbershop/src/core/fp/either.dart';
import 'package:dw11_barbershop/src/core/fp/nil.dart';
import 'package:dw11_barbershop/src/model/schedule_model.dart';

import './schedule_repository.dart';
import '../../core/restClient/rest_client.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final RestClient restClient;

  ScheduleRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, Nil>> scheduleClient(
      ({
        int barbershopId,
        String clientName,
        DateTime date,
        int time,
        int userId
      }) scheduleData) async {
    try {
      await restClient.auth.post('/schedules', data: {
        'barbershop_id': scheduleData.barbershopId,
        'user_id': scheduleData.userId,
        'client_name': scheduleData.clientName,
        'date': scheduleData.date.toIso8601String(),
        'time': scheduleData.time,
      });
      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao agendar horário', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Erro ao agendar horário'));
    }
  }

  @override
  Future<Either<RepositoryException, List<ScheduleModel>>> findScheduleyByDate(
      ({DateTime date, int userId}) filter) async {
    try {
      final Response(:List data) = await restClient.auth.get('/schedules',
          queryParameters: {
            'user_id': filter.userId,
            'date': filter.date.toIso8601String()
          });
      final schedules = data.map((s) => ScheduleModel.fromMap(s)).toList();
      return Success(schedules);
    } on DioException catch (e, s) {
      log('Erro ao buscar agedamentos de uma data', error: e, stackTrace: s);
      return Failure(RepositoryException(
          message: 'Erro ao buscar agendamentos de umma data'));
    } on ArgumentError catch (e, s) {
      log('Json inválido', error: e, stackTrace: s);
      return Failure(RepositoryException(message: 'Json inválido'));
    }
  }
}
