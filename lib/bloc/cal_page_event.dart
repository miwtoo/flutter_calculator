part of 'cal_page_bloc.dart';


abstract class CalPageEvent {
  const CalPageEvent();
  List<Object> get props => [];
}

class OperandEvent extends CalPageEvent {
  const OperandEvent(this.operand);
  final String operand;

  @override
  List<Object> get props => [operand];
}

class OperatorEvent extends CalPageEvent {
  const OperatorEvent(this.operator);
  final String operator;

  @override
  List<Object> get props => [operator];
}