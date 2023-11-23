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
      emit(OperationState(
        operation: state.operation.substring(0, state.operation.length - 1),
      ));
    }
  }

  void _onAdd(Add event, Emitter<OperationState> emit) {
    emit(OperationState(
      operation: state.operation + event.append,
    ));
  }
}
