import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'get_cine_event.dart';
import 'get_cine_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  GetDataBloc() : super(DataLoading()) {
    on<LoadDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(LoadDataEvent event, Emitter<GetDataState> emit) async {
    emit(DataLoading());
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('cine').get();
      if (querySnapshot.docs.isEmpty) {
        emit(DataEmpty());
      } else {
        final data = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        emit(DataLoaded(data: data));
      }
    } catch (e) {
      emit(DataError(message: e.toString()));
    }
  }
}
