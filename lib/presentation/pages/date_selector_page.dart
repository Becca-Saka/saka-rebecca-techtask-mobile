import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/core/constants/constants.dart';
import 'package:tech_task/core/routes/app_routes.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';

class DateSelectorPage extends StatelessWidget {
  DateSelectorPage({Key key}) : super(key: key);
  ValueNotifier<DateTime> selectedLunchDate = ValueNotifier(defaultDateTime);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: selectedLunchDate,
              builder: (context, value, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Hi there, Welcome!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select your preffered lunch date',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        DateTime selectedDate = await showDatePicker(
                          context: context,
                          initialDate: defaultDateTime,
                          firstDate: DateTime(1900),
                          lastDate: defaultDateTime,
                        );
                        selectedDate = selectedDate == null
                            ? DateTime(2021, 11, 10)
                            : selectedDate;
                        selectedLunchDate.value = selectedDate;
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        // height: 40,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300])),
                        child: Text(
                            'Lunch Date: ${DateFormat('yyyy-MM-dd').format(value)}'),
                      ),
                    ),
                    SizedBox(height: 100),
                    SizedBox(
                      height: 44,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          context
                              .read<RecipeBloc>()
                              .add(OnGetIngredient(selectedLunchDate.value));
                          Navigator.of(context)
                              .pushNamed(AppRoutes.ingrendientList);
                        },
                        child: Text('Show Ingredients'),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
