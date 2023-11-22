import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'operation_event.dart';
part 'operation_state.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  OperationBloc() : super(OperationState()) {
    on<OperationEvent>((event, emit) {
      on<Reset>(_onReset);
    });
  }

  void _onReset(Reset event, Emitter<OperationState> emit) {
    state.operation = "";
    emit(state);
  }

  void _onRemove(Remove event, Emitter<OperationState> emit) {
    state.operation = state.operation.substring(0, state.operation.length - 1);
    emit(state);
  }

  void _onAdd(Add event, Emitter<OperationState> emit) {
    state.operation += event.append;
    emit(state);
  }
}
