import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/data/models/ingredient_model.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const String dummyJsonUrl =
      "helpers/dummy_data/dummy_ingredient_response.json";
  final testIngredientModel = IngredientModel(
    title: 'Ham',
    useBy: DateTime.parse('2019-11-25'),
  );
  test(
    'should be a subclass of ingredient entity',
    () {
      //assert
      expect(testIngredientModel, isA<IngredientEntity>());
    },
  );

  test('should return a valid model from json', () {
    final List<dynamic> jsonList = json.decode(readJson(dummyJsonUrl));

    final result = jsonList.map((e) => IngredientModel.fromJson(e)).toList();

    expect(result, isA<List<IngredientEntity>>());

    expect(result.first, equals(testIngredientModel));
  });
  test('should return a json map from data model', () {
    final result = testIngredientModel.toJson();

    final expectedJsonMap = {
      'title': 'Ham',
      'use-by': '2019-11-25',
    };

    expect(result, equals(expectedJsonMap));
  });
}
