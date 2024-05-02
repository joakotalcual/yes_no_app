//Creamos la clase del modelo
import 'dart:math';

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  //Atributos de la clase
  final String answer;
  final bool forced;
  final String image;

  //Posibles respuestas
  List<String> respuestaAfirmativa = [
    // Respuestas afirmativas
    "¡Absolutamente!",
    "Por supuesto.",
    "Exacto.",
    "Sin duda.",
    "Por supuesto que sí.",
  ];

  List<String> respuestaNegativa = [
    // Respuestas negativas
    "No, eso no es posible.",
    "Lo siento, pero no.",
    "No, eso no funcionaría.",
    "Definitivamente no.",
    "Lo lamento, pero no es así.",
  ];

  List<String> respuestaTalVez = [
    // Respuestas de "tal vez"
    "Podría ser.",
    "No estoy seguro, depende.",
    "Es posible, pero no puedo estar seguro.",
    "Tal vez sí, tal vez no.",
    "No puedo confirmarlo ni negarlo en este momento."
  ];

  //El constructor de la clase con los atributos
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
  //El factory sirve para crear una nueva instancia
  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  //Crear una instancia de "Message" desde el modelo
  Message toMessageEntity() => Message(
      text: answer == 'yes'
          ? respuestaAfirmativa[Random().nextInt(respuestaAfirmativa.length)]
          : answer == 'no'
              ? respuestaNegativa[Random().nextInt(respuestaNegativa.length)]
              : respuestaTalVez[Random().nextInt(respuestaTalVez.length)],
      imageUrl: image,
      fromWho: FromWho.hers,
      hour: '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}'
    );
}
