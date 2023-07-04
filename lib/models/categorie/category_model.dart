import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    required List<Place> places,
  }) = _Category;

  factory Category.fromJson(dynamic json) => _$CategoryFromJson(json);
}

@freezed
class Place with _$Place {
  const factory Place(
      {required int id,
      required String name,
      required String desc,
      required String region,
      required double latitude,
      required double longitude,
      required List<String> pictures,
      required String category,
      required double rating}) = _Place;

  factory Place.fromJson(dynamic json) => _$PlaceFromJson(json);
}
