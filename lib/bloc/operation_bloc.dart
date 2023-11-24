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
    on<Compute>(_onCompute);
    on<Move>(_onMove);
  }

  void _onInit(Init event, Emitter<OperationState> emit) {
    emit(OperationState(
      operation: "",
    ));
  }

  void _onRemove(Remove event, Emitter<OperationState> emit) {
    if (state.cursor > 0) {
      int indexRemoved = state.cursor - 1;

      if (state.operation[state.cursor - 1] == "~") {
        emit(state.copyWith(
          operation: state.operation.substring(0, indexRemoved) + state.operation.substring(indexRemoved + 2),
          cursor: state.cursor - 1,
        ));
        return;
      }
      if (indexRemoved > 0 && state.operation[indexRemoved] == "/" && state.operation[indexRemoved - 1] == "~") {
        emit(state.copyWith(
          operation: state.operation.substring(0, indexRemoved - 1) + state.operation.substring(indexRemoved + 1),
          cursor: state.cursor - 2,
        ));
        return;
      }

      emit(state.copyWith(
        operation: state.operation.substring(0, indexRemoved) + state.operation.substring(indexRemoved + 1),
        cursor: state.cursor - 1,
      ));
    }
  }

  void _onAdd(Add event, Emitter<OperationState> emit) {
    if (event.append == "~/") {
      emit(state.copyWith(
        operation: state.operation.substring(0, state.cursor) + event.append + state.operation.substring(state.cursor),
        cursor: state.cursor + 2,
      ));
    } else {
      emit(state.copyWith(
        operation: state.operation.substring(0, state.cursor) + event.append + state.operation.substring(state.cursor),
        cursor: state.cursor + 1,
      ));
    }
  }

  void _onCompute(Compute event, Emitter<OperationState> emit) {
    double? result = state.result?.compute();

    if (result != null) {
      emit(state.copyWith(
        operation: "${result % 1 > 0 ? result : result.toInt()}",
      ));
    }
  }

  void _onMove(Move event, Emitter<OperationState> emit) {
    emit(state.copyWith(
      cursor: event.index,
    ));
  }
}
