import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../lexer/lexer.dart';
import '../lexer/token/token.dart';
import '../parser/parser.dart';
import '../parser/tree/tree_item.dart';

part 'operation_event.dart';

part 'operation_state.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  OperationBloc() : super(OperationState()) {
    on<Init>(_onInit);
    on<Remove>(_onRemove);
    on<Add>(_onAdd);
  }

  void _onInit(Init event, Emitter<OperationState> emit) {
    emit(OperationState(
      operation: "",
    ));
  }

  void _onRemove(Remove event, Emitter<OperationState> emit) {
    if (state.operation.isNotEmpty) {
      int indexRemoved = state.operation.length - 1;

      if (state.operation[indexRemoved] == "~") {
        emit(OperationState(
          operation: state.operation.substring(0, indexRemoved) + state.operation.substring(indexRemoved + 2),
        ));
        return;
      }
      if (indexRemoved > 0 && state.operation[indexRemoved] == "/" && state.operation[indexRemoved - 1] == "~") {
        emit(OperationState(
          operation: state.operation.substring(0, indexRemoved - 1) + state.operation.substring(indexRemoved + 1),
        ));
        return;
      }

      emit(OperationState(
        operation: state.operation.substring(0, indexRemoved) + state.operation.substring(indexRemoved + 1),
      ));
    }
  }

  void _onAdd(Add event, Emitter<OperationState> emit) {
    emit(OperationState(
      operation: state.operation + event.append,
    ));
  }
}
