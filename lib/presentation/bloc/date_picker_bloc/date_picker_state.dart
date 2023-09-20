import 'package:equatable/equatable.dart';

abstract class DatePickerState extends Equatable {
  DatePickerState();
  @override
  List<Object> get props => [];
}

class NoDateSelected extends DatePickerState {}

class DateSelected extends DatePickerState {
  final DateTime selectedDate;
  DateSelected(this.selectedDate);
}
