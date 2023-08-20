import 'package:dw11_barbershop/src/core/ui/restClient/rest_client.dart';
import 'package:dw11_barbershop/src/repositories/user/user_repository.dart';
import 'package:dw11_barbershop/src/repositories/user/user_repository_impl.dart';
import 'package:dw11_barbershop/src/services/users_login/user_login_service.dart';
import 'package:dw11_barbershop/src/services/users_login/user_login_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
UserLoginService userLoginService(UserLoginServiceRef ref) =>
    UserLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));
