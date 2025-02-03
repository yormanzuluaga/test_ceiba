part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  const GetUserEvent();
  @override
  List<Object> get props => [];
}

class GetPostsEvent extends UserEvent {
  const GetPostsEvent({required this.id});
  final String id;

  @override
  List<Object> get props => [];
}

class SearchUserEvent extends UserEvent {
  final String query;

  const SearchUserEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class SearchAboveUserEvent extends UserEvent {
  const SearchAboveUserEvent();

  @override
  List<Object> get props => [];
}
