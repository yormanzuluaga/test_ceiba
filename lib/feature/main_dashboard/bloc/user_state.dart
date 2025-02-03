part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.listUser = const [],
    this.aboveListUser = const [],
    this.listPosts = const [],
  });
  final List<UserModel>? listUser;
  final List<UserModel>? aboveListUser;
  final List<PostsModel>? listPosts;

  UserState copyWith({
    final List<UserModel>? listUser,
    final List<UserModel>? aboveListUser,
    final List<PostsModel>? listPosts,
  }) {
    return UserState(
      listUser: listUser ?? this.listUser,
      aboveListUser: aboveListUser ?? this.aboveListUser,
      listPosts: listPosts ?? this.listPosts,
    );
  }

  @override
  List<Object?> get props => [
        listUser,
        aboveListUser,
        listPosts,
      ];
}
