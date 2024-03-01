
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Hola', fromWho: FromWho.her),
    Message(text: '', imageUrl: 'https://yesno.wtf/assets/no/20-56c4b19517aa69c8f7081939198341a4.gif', fromWho: FromWho.her)
  ];

}