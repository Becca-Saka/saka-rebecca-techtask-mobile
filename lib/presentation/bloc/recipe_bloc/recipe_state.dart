import 'package:equatable/equatable.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';

abstract class RecipeState extends Equatable {
  RecipeState();
  @override
  List<Object> get props => [];
}

class NoIngredient extends RecipeState {}

class IngredientLoading extends RecipeState {}

class IngredientLoaded extends RecipeState {
  final List<IngredientEntity> ingredientList;
  IngredientLoaded({
    this.ingredientList = const <IngredientEntity>[],
  });
  @override
  List<Object> get props => [ingredientList];
}

class IngredientLoadFailure extends RecipeState {
  final String message;
  IngredientLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
