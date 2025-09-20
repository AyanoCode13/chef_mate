// recipe.dart
import 'package:freezed_annotation/freezed_annotation.dart';

// These are the generated files
part 'recipe.summary.api.model.freezed.dart';
part 'recipe.summary.api.model.g.dart';// Only if using JSON serialization

@freezed
abstract class RecipeSummaryApiModel with _$RecipeSummaryApiModel {
  const factory RecipeSummaryApiModel({
    required int id,
    required String title,
    required String image,
  }) = _RecipeSummaryApiModel;

  factory RecipeSummaryApiModel.fromJson(Map<String, dynamic> json) => _$RecipeSummaryApiModelFromJson(json);
  
}