import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/core/routes/app_routes.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

class IngredientListPage extends StatelessWidget {
  const IngredientListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredient List'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              buildWhen: (previous, current) {
                return !current.toString().startsWith('Recipe');
              },
              builder: (context, state) {
                if (state is NoIngredient || state is IngredientLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is IngredientLoadFailure) {
                  return Text('Something went wrong');
                }

                if (state is IngredientSelected) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.ingredientList.length,
                            itemBuilder: (context, index) {
                              final item = state.ingredientList[index];
                              final isSelected =
                                  state.selectedIngredientList.contains(item);
                              final isNotExpired =
                                  state.selectedLunchDate.isBefore(item.useBy);
                              return ListTile(
                                enabled: isNotExpired,
                                onTap: () {
                                  context
                                      .read<RecipeBloc>()
                                      .add(OnIngredientSelected(item));
                                },
                                title: Text('${item.title}'),
                                subtitle: Text(
                                    '${isNotExpired ? 'Exipres' : 'Expired on'}: ${DateFormat('yyyy-MM-dd').format(item.useBy)}'),
                                trailing: Checkbox(
                                  value: isSelected,
                                  onChanged: (_) {
                                    context
                                        .read<RecipeBloc>()
                                        .add(OnIngredientSelected(item));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Visibility(
                          visible: state.selectedIngredientList.isNotEmpty,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.todayMeal,
                                        arguments: state.selectedLunchDate);
                                    context.read<RecipeBloc>().add(OnGetRecipe(
                                        state.selectedIngredientList));
                                  },
                                  child: Text('Get Lunch'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
