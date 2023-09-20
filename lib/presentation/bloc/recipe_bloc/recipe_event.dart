import 'package:equatable/equatable.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';

abstract class RecipeEvent extends Equatable {
  RecipeEvent();
  @override
  List<Object> get props => [];
}

class OnGetIngredient extends RecipeEvent {
  final DateTime selectedLunchDate;
  OnGetIngredient(this.selectedLunchDate);
}

class OnIngredientSelected extends RecipeEvent {
  final IngredientEntity selectedIngredient;
  OnIngredientSelected(this.selectedIngredient);
  @override
  List<Object> get props => [selectedIngredient];
}

class OnGetRecipe extends RecipeEvent {
  final List<IngredientEntity> selectedIngredients;
  OnGetRecipe(this.selectedIngredients);
  @override
  List<Object> get props => [selectedIngredients];
}
