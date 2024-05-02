
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final ScrollController chatScrollController = ScrollController();
  //Importancia de la clase GETYESNOANSWER
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    // Message(text: 'Hola guapaaaaaaaaa', fromWho: FromWho.me),
    // Message(text: '¿Si vas a querer algo preciosa?', fromWho: FromWho.me),
    //Message(text: '', imageUrl: 'https://yesno.wtf/assets/no/20-56c4b19517aa69c8f7081939198341a4.gif', fromWho: FromWho.hers)
  ];

  //Método para enviar mensaje
  Future<void> sendMessage(String text) async{
    //El mensaje siempre va a ser mío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    //Notificar al provider
    if(text.endsWith('?')){
      herReply();
    }
    notifyListeners();
    moveScrollBottom();
    print('LOS MENSAJES TOTALES: ${messageList.length}');
    for (var message in messageList) {
      if(message.fromWho==FromWho.hers){
        print('Texto: ${message.text}');
      //print('Forzado: ${message.forced}');
      print('URL de la imagen: ${message.imageUrl}');
      print(''); // Agregar una línea en blanco para separar los mensajes
      }
    }
  }

  Future<void >herReply () async{
    //Obtener petición y almacenarlo en una variable
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom () async {
    //Pequeño retraso para garantizar la animación se vea bien
    await  Future.delayed(const Duration(microseconds: 200));
    chatScrollController.animateTo(
      //maxScrolExtent determina lo máximo que el scroll puede dar
      chatScrollController.position.maxScrollExtent, //Posición de la animación el OFFSET
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut
    );
  }
}