import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

class TodaysMealPage extends StatelessWidget {
  final DateTime selectedDate;
  const TodaysMealPage({
    Key key,
    @required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Meal for ${DateFormat('EEE, dd MMM. yy').format(selectedDate)}'),
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is NoRecipe || state is RecipeLoading) {
            return CircularProgressIndicator();
          }
          if (state is IngredientLoadFailure) {
            return Text('Something went wrong');
          }

          if (state is RecipeLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.recipeList.length,
                      itemBuilder: (context, index) {
                        final item = state.recipeList[index];
                        return ListTile(
                          title: Text('${item.title}'),
                          subtitle: Text(
                              'Ingredients: ${item.ingredients.join(', ')}'),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).popUntil(
                              (route) => route.isFirst,
                            );
                          },
                          child: Text('Search Again'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
