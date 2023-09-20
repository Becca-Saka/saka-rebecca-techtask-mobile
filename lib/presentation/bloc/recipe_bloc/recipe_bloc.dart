import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/domain/usecase/get_recipe.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_event.dart';
import 'package:tech_task/presentation/bloc/recipe_bloc/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GetRecipeUseCase _getRecipeUseCase;
  RecipeBloc(this._getRecipeUseCase) : super(NoIngredient()) {
    on<OnGetIngredient>(_onGetIngredient);
    on<OnIngredientSelected>(_onIngredientSelected);
  }

  Future<void> _onGetIngredient(OnGetIngredient event, Emitter emit) async {
    emit(IngredientLoading());
    final result = await _getRecipeUseCase.getIngredients();
    result.fold((failure) {
      emit(IngredientLoadFailure(failure.message));
    }, (data) {
      emit(IngredientLoaded(ingredientList: data));
    });
  }

  Future<void> _onIngredientSelected(
      OnIngredientSelected event, Emitter emit) async {
    emit(IngredientLoading());
    final result = await _getRecipeUseCase.getIngredients();
    result.fold((failure) {
      emit(IngredientLoadFailure(failure.message));
    }, (data) {
      emit(IngredientLoaded(ingredientList: data));
    });
  }
}
