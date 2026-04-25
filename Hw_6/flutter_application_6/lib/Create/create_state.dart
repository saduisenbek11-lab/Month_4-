import 'package:equatable/equatable.dart';
import 'package:flutter_application_6/response_model.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}

final class LoadingPostState extends PostState {}

final class ErrorPostState extends PostState {}

final class SuccessCreatedState extends PostState {
  final PostResponseModel postResponsModel;

  const SuccessCreatedState(this.postResponsModel);

  @override
  List<Object?> get props => [postResponsModel];
}

final class PostDetailsLoadedState extends PostState {
  final PostResponseModel post;

  const PostDetailsLoadedState(this.post);

  @override
  List<Object?> get props => [post];
}
final class PostDeletedState extends PostState {
  const PostDeletedState();
}

final class PostListLoadedState extends PostState {
  final List<PostResponseModel> posts;

  const PostListLoadedState(this.posts);

  @override
  List<Object?> get props => [posts];
}
