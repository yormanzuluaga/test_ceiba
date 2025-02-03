import 'dart:convert';
import 'dart:io';
import 'package:api_helper/api_helper.dart';
import 'package:either_dart/either.dart';

/// {@template example_resource}
/// An api resource to get the prompt terms.
/// {@endtemplate}
class UserResource {
  /// {@macro example_resource}
  UserResource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  // ignore: unused_field
  final ApiClient _apiClient;

  /// Get /game/prompt/terms
  ///
  /// Returns a [List<String>].
  Future<Either<ApiException, List<UserModel>>> getUser({
    Map<String, String>? headers,
  }) async {
    final response = await _apiClient.get(
      'users',
      modifiedHeaders: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      final loginResponse = (data as List).map((e) => UserModel.fromJson(e)).toList();

      return Right(loginResponse);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          response.body,
        ),
      );
    }
  }

  Future<Either<ApiException, List<PostsModel>>> getPosts({
    required String id,
    Map<String, String>? headers,
  }) async {
    final response = await _apiClient.get(
      'posts?userId=$id',
      modifiedHeaders: headers,
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      final loginResponse = (data as List).map((e) => PostsModel.fromJson(e)).toList();

      return Right(loginResponse);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          response.body,
        ),
      );
    }
  }
}
