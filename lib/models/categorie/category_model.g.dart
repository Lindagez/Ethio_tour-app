// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int,
      name: json['name'] as String,
      places: (json['places'] as List<dynamic>).map(Place.fromJson).toList(),
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'places': instance.places,
    };

_$_Place _$$_PlaceFromJson(Map<String, dynamic> json) => _$_Place(
      id: json['id'] as int,
      name: json['name'] as String,
      desc: json['desc'] as String,
      region: json['region'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      pictures:
          (json['pictures'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PlaceToJson(_$_Place instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'pictures': instance.pictures,
      'category': instance.category,
      'rating': instance.rating,
    };
