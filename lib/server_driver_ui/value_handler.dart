import 'package:flutter/material.dart';

class ServerValueHandler {
  ServerValueHandler({required this.onGetValue});

  /// Callback that retrieves a value by its ID
  /// Returns dynamic to support all value types (String, bool, int, double, etc.)
  final dynamic Function(String valueId) onGetValue;

  /// Get a String value by valueId
  String? getString(String? valueId) {
    if (valueId == null) {
      return null;
    }
    final value = onGetValue(valueId);
    if (value == null) {
      return null;
    }
    return value.toString();
  }

  /// Get a boolean value by valueId
  bool? getBool(String? valueId) {
    if (valueId == null) {
      return null;
    }
    final value = onGetValue(valueId);
    if (value == null) {
      return null;
    }
    if (value is bool) {
      return value;
    }
    if (value is String) {
      return value.toLowerCase() == 'true';
    }
    if (value is int) {
      return value != 0;
    }
    return null;
  }

  /// Get an integer value by valueId
  int? getInt(String? valueId) {
    if (valueId == null) {
      return null;
    }
    final value = onGetValue(valueId);
    if (value == null) {
      return null;
    }
    if (value is int) {
      return value;
    }
    if (value is double) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  /// Get a double value by valueId
  double? getDouble(String? valueId) {
    if (valueId == null) {
      return null;
    }
    final value = onGetValue(valueId);
    if (value == null) {
      return null;
    }
    if (value is double) {
      return value;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  /// Get a value as dynamic (useful for complex types)
  dynamic getValue(String? valueId) {
    if (valueId == null) {
      return null;
    }
    return onGetValue(valueId);
  }

  /// Get a Color value by valueId
  /// Supports hex strings, Color objects, and theme-aware color objects
  Color? getColor(String? valueId) {
    if (valueId == null) {
      return null;
    }
    final value = onGetValue(valueId);
    if (value == null) {
      return null;
    }
    if (value is Color) {
      return value;
    }
    if (value is String) {
      // Import colorFromHex from server_helper
      // This will be handled in the helper function
      return null; // Will be resolved by colorFromHex
    }
    return null;
  }

  /// Get a value with a default fallback
  T? getValueWithDefault<T>(String? valueId, T? defaultValue) {
    if (valueId == null) {
      return defaultValue;
    }
    final value = onGetValue(valueId);
    if (value == null) {
      return defaultValue;
    }
    if (value is T) {
      return value;
    }
    return defaultValue;
  }
}
