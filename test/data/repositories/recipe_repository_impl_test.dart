import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/core/error/exceptions.dart';
import 'package:tech_task/core/error/failure.dart';
import 'package:tech_task/data/repositories/recipe_repository_impl.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  MockRecipeDataSource mockRecipeDataSource;
  RecipeRepositoryImpl recipeRepositoryImpl;

  setUp(() {
    mockRecipeDataSource = MockRecipeDataSource();
    recipeRepositoryImpl = RecipeRepositoryImpl(
      recipeDataSource: mockRecipeDataSource,
    );
  });

  group('Get Ingredeint List', () {
    // test(
    //   'should return Ingredient list when a call to the data source is successful',
    //   () async {
    //     when(mockRecipeDataSource.getIngredients()).thenAnswer(
    //       (_) async => testIngredientModelList,
    //     );
    //     final result = await recipeRepositoryImpl.getIngredient();

    //     expect(
    //         result,
    //         equals(
    //             Right<Failure, List<IngredientEntity>>(testIngredientEntity)));
    //   },
    // );
    test(
      'should return server failure when a call to the data source is not successful',
      () async {
        when(mockRecipeDataSource.getIngredients())
            .thenThrow(ServerException());
        final result = await recipeRepositoryImpl.getIngredient();

        expect(result, equals(Left(ServerFailure('An error occurred'))));
      },
    );
    test(
      'should return connection failure when a device has no internet connection',
      () async {
        when(mockRecipeDataSource.getIngredients())
            .thenThrow(SocketException('Failed to connect to server'));
        final result = await recipeRepositoryImpl.getIngredient();

        expect(result,
            equals(Left(ConnectionFailure('Failed to connect to server'))));
      },
    );
  });
}
