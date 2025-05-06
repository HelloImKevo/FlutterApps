/// Utility function to preprocess a database map.
///
/// Converts integer values (`0` or `1`) into booleans for specified fields.
Map<String, dynamic> preprocessDbMap(
    Map<String, dynamic> map, List<String> booleanFields) {
  for (final field in booleanFields) {
    if (map.containsKey(field)) {
      map[field] = map[field] == 1;
    }
  }
  return map;
}
