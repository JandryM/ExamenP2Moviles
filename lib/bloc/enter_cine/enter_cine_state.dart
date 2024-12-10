import 'package:equatable/equatable.dart';

abstract class EnterDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EnterDataInitial extends EnterDataState {}

class EnterDataLoading extends EnterDataState {}

class EnterDataSuccess extends EnterDataState {}

class EnterDataError extends EnterDataState {
  final String message;

  EnterDataError({required this.message});

  @override
  List<Object?> get props => [message];
}
