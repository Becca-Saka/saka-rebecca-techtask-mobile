import 'package:dartz/dartz.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<IngredientEntity>>> getIngredient();
  // Future<Either<Failure, IngredientModel>> getRecipe();
}
