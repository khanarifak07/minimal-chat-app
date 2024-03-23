import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_chat_app/providers/auth_provider.dart';
import 'package:minimal_chat_app/screens/chat_page.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_services.dart';
import 'package:minimal_chat_app/utils.dart';
import 'package:minimal_chat_app/widgets/my_drawer.dart';
import 'package:minimal_chat_app/widgets/user_tile.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  //get the chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authPro = ref.watch(authProvider);
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                authPro.signOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

//build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("error");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        // return list view
        return ListView(
          children: snapshot.data!
              .map((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build individual user list tile
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except for current user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        //tap on a user -> go to chat page
        ontap: () {
          navigateToScreen(
            context,
            ChatPage(
              receiverEmail: userData["email"],
              receiverId: userData['uid'],
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
