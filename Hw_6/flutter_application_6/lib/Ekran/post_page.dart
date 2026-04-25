import 'package:flutter/material.dart';
import 'package:flutter_application_6/Create/create_block.dart';
import 'package:flutter_application_6/Create/create_state.dart';
import 'package:flutter_application_6/Ekran/detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts List')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) return const Center(child: CircularProgressIndicator());
          if (state is PostListLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title ?? ''),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PostDetailPage(postId: post.id!)),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('Error loading posts'));
        },
      ),
    );
  }
}