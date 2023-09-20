import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/presentation/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:tech_task/presentation/bloc/date_picker_bloc/date_picker_state.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

class IngredientListPage extends StatelessWidget {
  const IngredientListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredient List'),
      ),
      body: Column(
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
          BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {
              if (state is NoIngredient || state is IngredientLoading) {
                return CircularProgressIndicator();
              }
              if (state is IngredientLoadFailure) {
                return Text('Something went wrong');
              }

              if (state is IngredientLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: state.ingredientList.map(
                      (e) {
                        return InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name - ${e.title}'),
                              Text('Best Before - ${e.useBy}'),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RecipeBloc>().add(OnGetIngredient());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
