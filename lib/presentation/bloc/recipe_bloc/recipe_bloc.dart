import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/domain/entities/ingredient_entity.dart';
import 'package:tech_task/domain/usecase/get_recipe.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GetRecipeUseCase _getRecipeUseCase;

  RecipeBloc(this._getRecipeUseCase) : super(NoIngredient()) {
    on<OnGetIngredient>(_onGetIngredient);
    on<OnIngredientSelected>(_onIngredientSelected);
    on<OnGetRecipe>(_onGetRecipe);
  }

  Future<void> _onGetIngredient(OnGetIngredient event, Emitter emit) async {
    emit(IngredientLoading());
    final result = await _getRecipeUseCase.getIngredients();
    result.fold((failure) {
      emit(IngredientLoadFailure(failure.message));
    }, (data) {
      // emit(IngredientLoaded(ingredientList: data));
      emit(IngredientSelected(
        selectedLunchDate: event.selectedLunchDate,
        ingredientList: data,
      ));
    });
  }

  Future<void> _onIngredientSelected(
      OnIngredientSelected event, Emitter emit) async {
    final state = this.state;
    if (state is IngredientSelected) {
      final ingredientList = state.ingredientList;
      final selected = ingredientList
          .firstWhere((e) => e.title == event.selectedIngredient.title);

      if (state.selectedLunchDate.isBefore(selected.useBy)) {
        log('Ingredient ${selected.useBy} ${state.selectedLunchDate}');
        final selectedList =
            List<IngredientEntity>.from(state.selectedIngredientList)
              ..add(selected);
        emit(state.copyWith(
          ingredientList: ingredientList,
          selectedIngredientList: selectedList,
        ));
      }
    }
  }

  Future<void> _onGetRecipe(
      OnGetRecipe event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());

    final result = await _getRecipeUseCase
        .getRecipe(event.selectedIngredients.map((e) => e.title).toList());
    result.fold((failure) {
      emit(IngredientLoadFailure(failure.message));
    }, (data) {
      emit(RecipeLoaded(recipeList: data));
    });
  }
}
