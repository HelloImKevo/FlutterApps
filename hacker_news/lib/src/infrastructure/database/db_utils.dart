/// Utility functions for database data conversion and preprocessing.
///
/// These functions handle the conversion between Dart boolean values and
/// SQLite integer representations, ensuring data integrity during
/// database operations.

/// Safely preprocesses a database map without mutating the original.
///
/// Creates a copy of the input map and converts integer values (0 or 1)
/// into booleans for specified fields. This prevents accidental mutation
/// of the original data structure.
///
/// **Parameters:**
/// - [map]: The original database map to process
/// - [booleanFields]: List of field names that should be converted to booleans
///
/// **Returns:** A new map with boolean conversions applied
Map<String, dynamic> preprocessDbMapSafe(
    Map<String, dynamic> map, List<String> booleanFields) {
  final result = Map<String, dynamic>.from(map);

  for (final field in booleanFields) {
    if (result.containsKey(field) && result[field] != null) {
      final value = result[field];
      if (value is int) {
        result[field] = value == 1;
      }
    }
  }
  return result;
}

/// Safely converts boolean fields to integers without mutating the original.
///
/// Creates a copy of the input map and converts boolean values to integers
/// for SQLite compatibility (true -> 1, false -> 0). This ensures the
/// original object remains unchanged.
///
/// **Parameters:**
/// - [map]: The original map to process
/// - [booleanFields]: List of field names that should be converted to integers
///
/// **Returns:** A new map with integer conversions applied
Map<String, dynamic> convertBooleansToIntegersSafe(
    Map<String, dynamic> map, List<String> booleanFields) {
  final result = Map<String, dynamic>.from(map);

  for (final field in booleanFields) {
    if (result.containsKey(field) && result[field] != null) {
      final value = result[field];
      if (value is bool) {
        result[field] = value ? 1 : 0;
      }
    }
  }
  return result;
}

/// Legacy functions - kept for backward compatibility but deprecated.
///
/// ⚠️ WARNING: These functions mutate the input map, which can cause bugs.
/// Use the 'Safe' versions above instead.

/// Utility function to preprocess a database map.
///
/// ⚠️ DEPRECATED: This function mutates the input map. Use preprocessDbMapSafe instead.
///
/// Converts integer values (`0` or `1`) into booleans for specified fields.
@Deprecated('Use preprocessDbMapSafe instead - this function mutates the input')
Map<String, dynamic> preprocessDbMap(
    Map<String, dynamic> map, List<String> booleanFields) {
  for (final field in booleanFields) {
    if (map.containsKey(field)) {
      map[field] = map[field] == 1;
    }
  }
  return map;
}

/// Converts a map's boolean fields to integers for SQLite compatibility.
///
/// ⚠️ DEPRECATED: This function mutates the input map. Use convertBooleansToIntegersSafe instead.
@Deprecated(
    'Use convertBooleansToIntegersSafe instead - this function mutates the input')
Map<String, dynamic> convertBooleansToIntegers(
    Map<String, dynamic> map, List<String> booleanFields) {
  for (final field in booleanFields) {
    if (map.containsKey(field)) {
      map[field] = map[field] == true ? 1 : 0;
    }
  }
  return map;
}
