import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tech_task/core/error/exceptions.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/data/data_sources/recipe_data_source.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';
import 'package:tech_task/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeDataSource recipeDataSource;
  RecipeRepositoryImpl({
    this.recipeDataSource,
  });
  @override
  Future<Either<Failure, List<IngredientEntity>>> getIngredient() async {
    try {
      final result = await recipeDataSource.getIngredients();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure('An error occurred'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to server'));
    }
  }
}
