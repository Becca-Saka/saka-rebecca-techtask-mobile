import 'package:dartz/dartz.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/domain/models/ingredient.dart';
import 'package:tech_task/domain/repositories/recipe_repository.dart';

class GetRecipeUseCase {
  final RecipeRepository recipeRepository;
  GetRecipeUseCase(
    this.recipeRepository,
  );

  Future<Either<Failure, IngredientModel>> execute() {
    return recipeRepository.getRecipe();
  }
}