import 'package:equatable/equatable.dart';

abstract class GetDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DataLoading extends GetDataState {}

class DataLoaded extends GetDataState {
  final List<Map<String, dynamic>> data;

  DataLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class DataEmpty extends GetDataState {}

class DataError extends GetDataState {
  final String message;

  DataError({required this.message});

  @override
  List<Object?> get props => [message];
}
