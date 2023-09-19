import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_task/core/constants/constants.dart';
import 'package:tech_task/core/error/exceptions.dart';
import 'package:tech_task/data/models/ingredient_model.dart';

abstract class RecipeDataSource {
  Future<List<IngredientModel>> getIngredients();
}

class RecipeDataSourceImpl extends RecipeDataSource {
  final http.Client client;
  RecipeDataSourceImpl({
    this.client,
  });
  @override
  Future<List<IngredientModel>> getIngredients() async {
    final response = await client.get(Uri.parse(Urls.ingredientListUrl));

    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      final responselist = decodedBody as List;
      final _ingredientList =
          responselist.map((e) => IngredientModel.fromJson(e)).toList();

      return _ingredientList;
    } else {
      throw ServerException();
    }
  }
}
