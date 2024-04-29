
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer{
  //Crea la instancia de la clase DIO
  //Nnos ayudará a manejar las peticiones
  final _dio = Dio();

  //Obtiene la respuesta
  Future<Message> getAnswer() async{
    //Almacenar los datos de la petición GET
    final response = await _dio.get('https://yesno.wtf/api');

  throw UnimplementedError();
    return Message(text: 'text', fromWho: FromWho.me);
  }
}