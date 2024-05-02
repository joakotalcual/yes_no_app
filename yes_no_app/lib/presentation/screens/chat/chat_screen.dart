import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://media1.popsugar-assets.com/files/thumbor/nTOpvfFrl8bM-0ZYSjfSM5JfNQE/160x160/filters:format_auto-!!-:strip_icc-!!-:sharpen-!1,0,true!-/2019/11/06/498/n/1922283/813e955fbcf6984a_GettyImages-1127357426/i/Sydney-Sweeney.jpg'),
          ),
        ),
        title: const Text("Mi amor <3"),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index)
                {
                  final message = chatProvider.messageList[index];
                  //Asignar MessageBubble a partir de quién venga el mensaje
                  return (message.fromWho == FromWho.hers)
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble(message: message);
              }),
            ),
            MesssageFieldBox(onValue:(String){
              if (String.isNotEmpty) {
                chatProvider.sendMessage(String);
              }
            },),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}