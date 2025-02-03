part of 'injection_container.dart';

void _initResourcesInjections() {
  sl.registerFactory<UserResource>(() => UserResource(
        apiClient: sl(),
      ));
}
