
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{
  //Crea la instancia de la clase DIO
  //Nnos ayudará a manejar las peticiones
  final _dio = Dio();

  //Obtiene la respuesta
  Future<Message> getAnswer() async{
    //Almacenar los datos de la petición GET
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();
  }
}