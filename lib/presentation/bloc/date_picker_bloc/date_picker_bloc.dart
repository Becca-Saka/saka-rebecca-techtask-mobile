import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_picker_event.dart';
import 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(NoDateSelected()) {
    on<OnLunchDateSelected>((event, emit) async {
      emit(DateSelected(event.selectedDate));
    });
  }
}
