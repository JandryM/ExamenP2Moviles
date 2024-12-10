import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'enter_cine_event.dart';
import 'enter_cine_state.dart';

class EnterDataBloc extends Bloc<EnterDataEvent, EnterDataState> {
  EnterDataBloc() : super(EnterDataInitial()) {
    on<SubmitDataEvent>(_onSubmitData);
  }

  Future<void> _onSubmitData(
      SubmitDataEvent event, Emitter<EnterDataState> emit) async {
    emit(EnterDataLoading());
    try {
      await FirebaseFirestore.instance.collection('cine').add({
        'nombre': event.nombre,
        'duracion': event.duracion,
        'enCartelera': event.enCartelera,
      });
      emit(EnterDataSuccess());
    } catch (e) {
      emit(EnterDataError(message: e.toString()));
    }
  }
}
