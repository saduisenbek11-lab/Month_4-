import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/Create/create_block.dart';
import 'package:flutter_application_6/Create/create_event.dart';
import 'package:flutter_application_6/Create/create_state.dart';
import 'package:flutter_application_6/Api/api_servise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailPage extends StatelessWidget {
  final int postId;
  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(ApiService())..add(FetchPostDetailsEvent(postId)),
      child: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostDeletedState) {
            Navigator.pop(context); 
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Удалено')));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Post Details'),
            actions: [
              Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _showDeleteDialog(context),
                );
              })
            ],
          ),
          body: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is LoadingPostState) return const Center(child: CircularProgressIndicator());
              if (state is PostDetailsLoadedState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(state.post.title ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(state.post.body ?? ''),
                    ],
                  ),
                );
              }
              return const Center(child: Text('Error'));
            },
          ),
        ),
      ),
    );
  }
void _showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Удалить пост?'),
      content: const Text('Может не надо?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(dialogContext); 
          },
          child: const Text('Нет'),
        ),
        TextButton(
          onPressed: () {
            context.read<PostBloc>().add(DeletePostEvent(postId));
            
            Navigator.pop(dialogContext); 
          },
          child: const Text(
            'Да, удалить',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
}