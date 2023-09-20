import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/data/models/recipe_model.dart';
import 'package:tech_task/domain/entities/recipe_entity.dart';

import '../../helpers/dummy_data/const_test_data.dart';
import '../../helpers/json_reader.dart';

void main() {
  test(
    'should be a subclass of recipe entity',
    () {
      //assert
      expect(testRecipeEntity, isA<RecipeEntity>());
    },
  );

  test('should return a valid model from json', () {
    final List<dynamic> jsonList = json.decode(readJson(dummyRecipeJsonUrl));

    final result = jsonList.map((e) => RecipeModel.fromJson(e)).toList();

    expect(result, isA<List<RecipeEntity>>());
    expect(result.first, equals(testRecipeModel));
  });

  test('should return a json map from data model', () {
    final result = testRecipeModel.toJson();

    final expectedJsonMap = {
      "title": "Ham and Cheese Toastie",
      "ingredients": [
        "Ham",
        "Cheese",
        "Bread",
        "Butter",
      ],
    };

    expect(result, equals(expectedJsonMap));
  });
}
