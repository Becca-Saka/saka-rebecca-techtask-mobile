import 'package:dartz/dartz.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/domain/models/ingredient.dart';

abstract class RecipeRepository {
  Future<Either<Failure, IngredientModel>> getRecipe();
}