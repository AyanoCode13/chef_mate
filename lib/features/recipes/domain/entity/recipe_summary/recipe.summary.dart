import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.summary.freezed.dart';
part 'recipe.summary.g.dart';

@freezed
abstract class RecipeSummary with _$RecipeSummary {
  const factory RecipeSummary({
    required String id,
    required String title,
    required String imageUrl,
  }) = _RecipeSummary;

  factory RecipeSummary.fromJson(Map<String, dynamic> json) =>
      _$RecipeSummaryFromJson(json);
}