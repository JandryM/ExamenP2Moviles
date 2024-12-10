import 'package:equatable/equatable.dart';

abstract class EnterDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitDataEvent extends EnterDataEvent {
  final String nombre;
  final int duracion;
  final bool enCartelera;

  SubmitDataEvent({
    required this.nombre,
    required this.duracion,
    required this.enCartelera,
  });

  @override
  List<Object?> get props => [nombre, duracion, enCartelera];
}
