import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(UserState()) {
    on<UserEvent>((event, emit) {});

    on<GetUserEvent>((event, emit) async {
      final result = await _userRepository.getUser();

      result.fold((l) {}, (r) {
        emit(state.copyWith(listUser: r, aboveListUser: r));
      });
    });

    on<GetPostsEvent>((event, emit) async {
      final result = await _userRepository.getPosts(id: event.id);

      result.fold((l) {}, (r) {
        emit(state.copyWith(listPosts: r));
      });
    });

    on<SearchUserEvent>((event, emit) async {
      final data = state.listUser!.where((breed) {
        return breed.name!.toLowerCase().contains(event.query);
      }).toList();

      emit(state.copyWith(
        listUser: data,
      ));
    });
    on<SearchAboveUserEvent>((event, emit) async {
      emit(state.copyWith(
        listUser: state.aboveListUser,
        aboveListUser: state.aboveListUser,
      ));
    });
  }
  final UserRepository _userRepository;
}
