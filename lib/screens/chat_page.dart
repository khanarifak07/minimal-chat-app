import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_services.dart';
import 'package:minimal_chat_app/widgets/textfield.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;
  const ChatPage(
      {super.key, required this.receiverEmail, required this.receiverId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //chat and auth service
  final AuthService _auth = AuthService();
  final ChatService _chat = ChatService();

  //message text controller
  TextEditingController messageCtrl = TextEditingController();

//send message method
  void sendMessage() async {
    //if there is somethng inside text field
    if (messageCtrl.text.isNotEmpty) {
      //send message
      await _chat.sendMessage(widget.receiverId, messageCtrl.text);
      //clear the controllers
      messageCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [
          //display all messages

          Expanded(child: _buildMessageList()),
          //bottom user input
          _buildUserInput()
        ],
      ),
    );
  }

//build message list
  Widget _buildMessageList() {
    String senderId = _auth.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chat.getMessages(widget.receiverId, senderId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //check for error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //check for loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        //return List
        return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList());
      },
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data['message']);
  }

  //build user input
  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: KTextField(
            controller: messageCtrl,
            hintText: "Type here...",
            obscureText: false,
          ),
        ),
        IconButton(
            onPressed: () {
              sendMessage();
            },
            icon: const Icon(Icons.arrow_upward))
      ],
    );
  }
}
