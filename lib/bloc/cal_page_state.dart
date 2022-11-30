part of 'cal_page_bloc.dart';

@immutable
abstract class CalPageState {
  const CalPageState({this.output = 'infinity'});

  final String output;

  List<Object> get pros => [];
}

class CalPageInitial extends CalPageState {

  @override
  String get output => '0';

  @override
  List<Object> get pros => [output];
}


class CalFirstOperand extends CalPageState {
  const CalFirstOperand(this.first);
  final String first;
  @override
  String get output => first;

  @override
  List<Object> get pros => [output];
}