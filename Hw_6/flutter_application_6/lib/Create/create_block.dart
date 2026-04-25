import 'package:bloc/bloc.dart';
import 'package:flutter_application_6/Create/create_event.dart';
import 'package:flutter_application_6/Create/create_state.dart';
import 'package:flutter_application_6/Api/api_servise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService _apiService;

  PostBloc(this._apiService) : super(PostInitial()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(LoadingPostState());
      try {
        final posts = await _apiService.getPosts();
        emit(PostListLoadedState(posts));
      } catch (e) { emit(ErrorPostState()); }
    });

    on<FetchPostDetailsEvent>((event, emit) async {
      emit(LoadingPostState());
      try {
        final post = await _apiService.getPostById(event.postId);
        emit(PostDetailsLoadedState(post));
      } catch (e) { emit(ErrorPostState()); }
    });

    on<DeletePostEvent>((event, emit) async {
      emit(LoadingPostState());
      try {
        await _apiService.deletePost(event.postId);
        emit(PostDeletedState());
      } catch (e) { emit(ErrorPostState()); }
    });
  }
}