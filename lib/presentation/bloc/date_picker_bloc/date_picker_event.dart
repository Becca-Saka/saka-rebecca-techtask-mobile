import 'package:equatable/equatable.dart';

abstract class DatePickerEvent extends Equatable {
  DatePickerEvent();
  @override
  List<Object> get props => [];
}

class OnLunchDateSelected extends DatePickerEvent {
  final DateTime selectedDate;
  OnLunchDateSelected(this.selectedDate);
}
