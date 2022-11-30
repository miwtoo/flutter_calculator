import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'cal_page_event.dart';
part 'cal_page_state.dart';

class CalPageBloc extends Bloc<CalPageEvent, CalPageState> {
  CalPageBloc() : super(CalPageInitial()) {
    on<OperandEvent>(_handleOperand);
    on<OperatorEvent>(_handleOperator);
  }

  void _handleOperand (OperandEvent event, Emitter<CalPageState> emit) {
    debugPrint(event.operand);
    if(state is CalPageInitial){
      emit(CalFirstOperand(event.operand));
    } else if (state is CalFirstOperand) {
      emit(CalFirstOperand("${state.output}${event.operand}"));
    } 
  }
  void _handleOperator (OperatorEvent event, Emitter<CalPageState> emit) {
    debugPrint(event.operator);
    if(event.operator == 'C'){
      emit(CalPageInitial());
    }

  }
}
