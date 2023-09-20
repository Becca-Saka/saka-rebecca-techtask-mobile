import 'package:equatable/equatable.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';
import 'package:tech_task/domain/entities/recipe_entity.dart';

abstract class RecipeState extends Equatable {
  RecipeState();
  @override
  List<Object> get props => [];
}

class NoIngredient extends RecipeState {}

class IngredientLoading extends RecipeState {}

// class IngredientLoaded extends RecipeState {
//   final List<IngredientEntity> ingredientList;
//   IngredientLoaded({
//     this.ingredientList = const <IngredientEntity>[],
//   });
//   @override
//   List<Object> get props => [ingredientList];
// }

class IngredientSelected extends RecipeState {
  final List<IngredientEntity> ingredientList;
  final List<IngredientEntity> selectedIngredientList;
  IngredientSelected({
    this.ingredientList = const <IngredientEntity>[],
    this.selectedIngredientList = const <IngredientEntity>[],
  });
  @override
  List<Object> get props => [ingredientList, selectedIngredientList];
}

class IngredientLoadFailure extends RecipeState {
  final String message;
  IngredientLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}

class NoRecipe extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeEntity> recipeList;
  RecipeLoaded({
    this.recipeList = const <RecipeEntity>[],
  });
  @override
  List<Object> get props => [recipeList];
}
