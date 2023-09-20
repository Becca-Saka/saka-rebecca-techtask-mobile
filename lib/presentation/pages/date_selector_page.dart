import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/presentation/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:tech_task/presentation/bloc/date_picker_bloc/date_picker_event.dart';
import 'package:tech_task/presentation/bloc/date_picker_bloc/date_picker_state.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';
import 'package:tech_task/presentation/pages/ingredient_list_page.dart';

class DateSelectorPage extends StatelessWidget {
  const DateSelectorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<DatePickerBloc, DatePickerState>(
            builder: (context, state) {
              if (state is NoDateSelected) {
                return Text('No date selected');
              }

              if (state is DateSelected) {
                return Text('${state.selectedDate}');
              }
              return SizedBox.shrink();
            },
          ),
          Center(
            child: TextButton(
              child: Text('Select Prefered Lunch Date'),
              onPressed: () async {
                DateTime selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                selectedDate =
                    selectedDate == null ? DateTime.now() : selectedDate;
                context
                    .read<DatePickerBloc>()
                    .add(OnLunchDateSelected(selectedDate));

                context.read<RecipeBloc>().add(OnGetIngredient());
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => IngredientListPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
