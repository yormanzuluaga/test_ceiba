part of 'injection_container.dart';

void _initRepositoriesInjections() {
  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(userResource: sl()));
}
