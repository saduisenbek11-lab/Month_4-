import 'package:equatable/equatable.dart';
import 'package:flutter_application_6/response_model.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}
final class FetchPostsEvent extends PostEvent {}

final class FetchPostDetailsEvent extends PostEvent {
  final int postId;
  const FetchPostDetailsEvent(this.postId);

  @override
  List<Object?> get props => [postId];
}

final class CreatePostEvent extends PostEvent {
  const CreatePostEvent({required this.createPost});
  final PostResponseModel createPost;

  @override
  List<Object?> get props => [createPost];
}

final class DeletePostEvent extends PostEvent {
  final int postId;
  const DeletePostEvent(this.postId);

  @override
  List<Object?> get props => [postId]; 
}