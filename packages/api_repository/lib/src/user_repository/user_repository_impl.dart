import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  UserResource userResource;
  @override
  UserRepositoryImpl({
    required this.userResource,
  });

  @override
  Future<Either<ApiException, List<UserModel>>> getUser({
    Map<String, String>? headers,
  }) async {
    final movieModel = await userResource.getUser(
      headers: headers,
    );
    return movieModel.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<ApiException, List<PostsModel>>> getPosts({
    required String id,
    Map<String, String>? headers,
  }) async {
    final movieModel = await userResource.getPosts(
      id: id,
      headers: headers,
    );
    return movieModel.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
