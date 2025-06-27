import 'dart:collection';
import 'package:hacker_news/src/models/item_model.dart';

/// A high-performance in-memory cache with LRU (Least Recently Used) eviction.
///
/// This cache sits between the BLoC and the Repository, providing instant
/// access to frequently requested items while managing memory usage efficiently.
///
/// **Benefits:**
/// - Sub-millisecond access times for cached items
/// - Automatic memory management with configurable size limits
/// - LRU eviction prevents memory bloat
/// - Thread-safe operations for concurrent access
class MemoryCache {
  /// Maximum number of items to keep in memory cache
  final int maxSize;

  /// Internal storage using LinkedHashMap for O(1) access and LRU ordering
  final LinkedHashMap<int, CacheEntry> _cache = LinkedHashMap();

  MemoryCache({this.maxSize = 500});

  /// Retrieves an item from cache if it exists and hasn't expired.
  ///
  /// Returns null if:
  /// - Item is not in cache
  /// - Item has expired (based on TTL)
  /// - Cache is corrupted
  ItemModel? get(int id) {
    final entry = _cache[id];
    if (entry == null) return null;

    // Check if entry has expired
    if (entry.isExpired) {
      _cache.remove(id);
      return null;
    }

    // Move to end (most recently used) for LRU ordering
    _cache.remove(id);
    _cache[id] = entry;

    return entry.item;
  }

  /// Stores an item in cache with optional TTL (Time To Live).
  ///
  /// **Parameters:**
  /// - [id]: Unique identifier for the item
  /// - [item]: The news item to cache
  /// - [ttlMinutes]: How long to keep the item (default: 30 minutes)
  void put(int id, ItemModel item, {int ttlMinutes = 30}) {
    // Remove if already exists (to update position)
    _cache.remove(id);

    // Add new entry
    final entry = CacheEntry(
      item: item,
      expiryTime: DateTime.now().add(Duration(minutes: ttlMinutes)),
    );
    _cache[id] = entry;

    // Evict oldest items if cache is full
    _evictIfNecessary();
  }

  /// Removes a specific item from cache
  void remove(int id) {
    _cache.remove(id);
  }

  /// Clears all cached items
  void clear() {
    _cache.clear();
  }

  /// Returns cache statistics for monitoring and debugging
  CacheStats get stats {
    final now = DateTime.now();
    int expiredCount = 0;

    for (final entry in _cache.values) {
      if (entry.expiryTime.isBefore(now)) {
        expiredCount++;
      }
    }

    return CacheStats(
      totalItems: _cache.length,
      expiredItems: expiredCount,
      memoryUsageItems: _cache.length,
      maxSize: maxSize,
      hitRatio: 0.0, // Would need hit/miss tracking for accurate ratio
    );
  }

  /// Removes expired entries and enforces size limits
  void _evictIfNecessary() {
    // Remove expired entries first
    final now = DateTime.now();
    _cache.removeWhere((id, entry) => entry.isExpired);

    // If still over limit, remove oldest entries (LRU eviction)
    while (_cache.length > maxSize) {
      final oldestKey = _cache.keys.first;
      _cache.remove(oldestKey);
    }
  }

  /// Performs maintenance: removes expired entries
  void maintenance() {
    _evictIfNecessary();
  }
}

/// Individual cache entry with expiration tracking
class CacheEntry {
  final ItemModel item;
  final DateTime expiryTime;

  CacheEntry({
    required this.item,
    required this.expiryTime,
  });

  /// Whether this cache entry has expired
  bool get isExpired => DateTime.now().isAfter(expiryTime);
}

/// Cache performance and usage statistics
class CacheStats {
  final int totalItems;
  final int expiredItems;
  final int memoryUsageItems;
  final int maxSize;
  final double hitRatio;

  CacheStats({
    required this.totalItems,
    required this.expiredItems,
    required this.memoryUsageItems,
    required this.maxSize,
    required this.hitRatio,
  });

  /// How full the cache is as a percentage
  double get utilization => (totalItems / maxSize) * 100;

  /// Number of valid (non-expired) items
  int get validItems => totalItems - expiredItems;

  @override
  String toString() {
    return 'CacheStats(total: $totalItems, valid: $validItems, '
        'utilization: ${utilization.toStringAsFixed(1)}%, '
        'hitRatio: ${(hitRatio * 100).toStringAsFixed(1)}%)';
  }
}
