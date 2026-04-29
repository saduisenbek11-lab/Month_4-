import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/Setting/Theme/theme_block.dart';
import 'package:flutter_application_2/Setting/Theme/theme_event.dart';
import 'package:flutter_application_2/Setting/Theme/theme_state.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> _signInWithGoogle() async {
    await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
  }

  @override
  Widget build(BuildContext context) {
    final themeBlock = context.read<ThemeBlock>();
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (user == null)
            Center(
              child: ElevatedButton(
                onPressed: _signInWithGoogle,
                child: const Text("Sign in with Google"),
              ),
            )
          else
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: user.photoURL != null
                        ? NetworkImage(user.photoURL!)
                        : null,
                    child: user.photoURL == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.displayName ?? "No Name",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.email ?? "No Email",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 30),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Theme"),
              BlocBuilder<ThemeBlock, ThemeState>(
                builder: (context, state) {
                  bool isDark = false;
                  if (state is GetValueThemeState) {
                    isDark = state.value;
                  }
                  return Switch(
                    value: isDark,
                    onChanged: (value) {
                      themeBlock.add(ChangeThemeEvent(value: value));
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}