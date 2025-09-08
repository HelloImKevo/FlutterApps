import 'dart:math' as math;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

/// Represents a geographic coordinate with latitude and longitude
/// 
/// This value object ensures valid geographic coordinates and provides
/// utility methods for coordinate operations commonly used in coastal modeling.
@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required double latitude,
    required double longitude,
    @Default(0.0) double elevation,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}

extension CoordinatesExtension on Coordinates {
  /// Validates that coordinates are within valid ranges
  bool get isValid {
    return latitude >= -90.0 &&
        latitude <= 90.0 &&
        longitude >= -180.0 &&
        longitude <= 180.0;
  }

  /// Returns a formatted string representation
  String get formatted {
    final latDir = latitude >= 0 ? 'N' : 'S';
    final lonDir = longitude >= 0 ? 'E' : 'W';
    return '${latitude.abs().toStringAsFixed(6)}°$latDir, '
        '${longitude.abs().toStringAsFixed(6)}°$lonDir';
  }

  /// Calculates distance to another coordinate in meters using Haversine formula
  double distanceTo(Coordinates other) {
    const double earthRadius = 6371000; // Earth's radius in meters
    
    final double lat1Rad = latitude * (math.pi / 180.0);
    final double lat2Rad = other.latitude * (math.pi / 180.0);
    final double deltaLatRad = (other.latitude - latitude) * (math.pi / 180.0);
    final double deltaLonRad = (other.longitude - longitude) * (math.pi / 180.0);

    final double a = math.sin(deltaLatRad / 2) * math.sin(deltaLatRad / 2) +
        math.cos(lat1Rad) * math.cos(lat2Rad) *
        math.sin(deltaLonRad / 2) * math.sin(deltaLonRad / 2);
    
    final double c = 2 * math.asin(math.sqrt(a));
    
    return earthRadius * c;
  }

  /// Calculates bearing to another coordinate in degrees
  double bearingTo(Coordinates other) {
    final double lat1Rad = latitude * (math.pi / 180.0);
    final double lat2Rad = other.latitude * (math.pi / 180.0);
    final double deltaLonRad = (other.longitude - longitude) * (math.pi / 180.0);

    final double y = math.sin(deltaLonRad) * math.cos(lat2Rad);
    final double x = math.cos(lat1Rad) * math.sin(lat2Rad) - 
        math.sin(lat1Rad) * math.cos(lat2Rad) * math.cos(deltaLonRad);

    final double bearingRad = math.atan2(y, x);
    final double bearingDeg = bearingRad * (180.0 / math.pi);

    return (bearingDeg + 360) % 360;
  }
}

/// Factory for creating common coordinate instances
class CoordinatesFactory {
  CoordinatesFactory._();

  /// Creates coordinates for a typical coastal location
  static Coordinates createCoastal({
    required double latitude,
    required double longitude,
    double elevation = 0.0,
  }) {
    final coords = Coordinates(
      latitude: latitude,
      longitude: longitude,
      elevation: elevation,
    );
    
    if (!coords.isValid) {
      throw ArgumentError('Invalid coordinates: $latitude, $longitude');
    }
    
    return coords;
  }

  /// Creates coordinates from decimal degrees string
  static Coordinates fromString(String coordinateString) {
    final parts = coordinateString.split(',');
    if (parts.length < 2) {
      throw FormatException('Invalid coordinate format: $coordinateString');
    }
    
    final latitude = double.parse(parts[0].trim());
    final longitude = double.parse(parts[1].trim());
    final elevation = parts.length > 2 ? double.parse(parts[2].trim()) : 0.0;
    
    return createCoastal(
      latitude: latitude,
      longitude: longitude,
      elevation: elevation,
    );
  }

  /// Common test locations for coastal modeling
  static Coordinates get gulfOfMexico => const Coordinates(
        latitude: 27.7663,
        longitude: -82.6404,
      );

  static Coordinates get atlanticCoast => const Coordinates(
        latitude: 36.8485,
        longitude: -75.9755,
      );

  static Coordinates get pacificCoast => const Coordinates(
        latitude: 37.7749,
        longitude: -122.4194,
      );

  static Coordinates get chesapeakeBay => const Coordinates(
        latitude: 38.9784,
        longitude: -76.4951,
      );
}
