import 'package:bloc/bloc.dart';
import 'package:developer_calculator/model/item/item.dart';
import 'package:developer_calculator/model/item/number.dart';
import 'package:developer_calculator/model/tree/operator_tree.dart';
import 'package:developer_calculator/model/tree/tree_item.dart';
import 'package:flutter/material.dart';

import '../model/item/operator.dart';
import '../model/item/point.dart';
import '../model/tree/value.dart';

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
      operation: const [],
    ));
  }

  void _onRemove(Remove event, Emitter<OperationState> emit) {
    if (state.operation.isNotEmpty) {
      if (state.operation.last is Number) {
        (state.operation.last as Number).removeNumber();
        if ((state.operation.last as Number).value == "") {
          emit(OperationState(
            operation: state.operation.sublist(0, state.operation.length - 1),
          ));
        } else {
          emit(OperationState(
            operation: state.operation,
          ));
        }
        return;
      }
      emit(OperationState(
        operation: state.operation.sublist(0, state.operation.length - 1),
      ));
    }
  }

  void _onAdd(Add event, Emitter<OperationState> emit) {
    if (event.append is Operator &&
        state.operation.isNotEmpty &&
        state.operation.last is Number) {
      emit(OperationState(
        operation: [...state.operation, event.append],
      ));
    } else if (event.append is Point &&
        state.operation.isNotEmpty &&
        state.operation.last is Number) {
      if (state.operation.length > 2 &&
          state.operation[state.operation.length - 2] is Point) {
        return;
      }
      emit(OperationState(
        operation: [...state.operation, event.append],
      ));
    } else if (event.append is Number) {
      if (state.operation.isNotEmpty && state.operation.last is Number) {
        (state.operation.last as Number).addNumber(
            (event.append as Number).value,
            state.operation.length > 2 &&
                state.operation[state.operation.length - 2] is Point);
        emit(OperationState(
          operation: state.operation,
        ));
      } else {
        emit(OperationState(
          operation: [...state.operation, event.append],
        ));
      }
    }
  }
}
