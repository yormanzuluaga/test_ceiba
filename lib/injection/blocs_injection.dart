part of 'injection_container.dart';

void _initBlocsInjections() {
  sl.registerFactory(
    () => UserBloc(userRepository: sl()),
  );
}
