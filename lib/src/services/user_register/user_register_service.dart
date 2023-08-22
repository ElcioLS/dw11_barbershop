import 'package:dw11_barbershop/src/core/exceptions/service_exception.dart';
import 'package:dw11_barbershop/src/core/fp/nil.dart';

import '../../core/fp/either.dart';

abstract interface class UserRegisterService {
  Future<Either<ServiceException, Nil>> execute(
    ({
      String name,
      String email,
      String password,
    }) userData,
  );
}
