import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final String latitude;
  final String longitude;
  final int placeId;
  final String name;
  final String displayName;

  CountryModel({
    required this.latitude,
    required this.longitude,
    required this.placeId,
    required this.name,
    required this.displayName,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      displayName: json['display_name'] ?? '',
      placeId: int.tryParse(json['place_id']?.toString() ?? '') ?? 0,
      name: json['name'] ?? '',
      latitude: (json['lat'] ?? '0.0').toString(),
      longitude: (json['lon'] ?? '0.0').toString(),
    );
  }

  @override
  List<Object?> get props => [latitude, longitude, placeId, name, displayName];
}