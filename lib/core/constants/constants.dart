class Urls {
  static const String baseUrl =
      'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev/';
  static const String ingredientListUrl = '$baseUrl/ingredients';
  static const String recipesUrl = '$baseUrl/recipes?ingredients=';
}

DateTime defaultDateTime = DateTime(2020, 11, 26);
