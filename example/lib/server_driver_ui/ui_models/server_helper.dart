import 'package:flutter/material.dart';

/// Converts a Color to hex string format (e.g., "#FFFFFF" or "#FFFFFFFF")
String? colorToHex(Color? color) {
  if (color == null) return null;
  final value = color.value;
  final hex = value.toRadixString(16).toUpperCase().padLeft(8, '0');
  return '#$hex';
}

/// Universal color parser that automatically handles:
/// - Simple hex strings: "#FFFFFF" or "FFFFFF"
/// - Theme-aware objects: { "light": "#FFFFFF", "dark": "#000000" }
/// - Dynamic colors via colorValueId: { "colorValueId": "primary_color" }
/// - Legacy integer format: 4294967295
///
/// Automatically resolves theme-aware colors when brightness is provided.
/// If brightness is not provided, it will be resolved using BuildContext in toWidget() methods.
Color? colorFromHex(
  dynamic value, {
  Brightness? brightness,
  dynamic Function(String)? valueResolver,
}) {
  if (value == null) return null;

  // Handle theme-aware color object or colorValueId
  if (value is Map<String, dynamic>) {
    // Check for colorValueId first (for dynamic colors)
    if (value.containsKey('colorValueId')) {
      final colorValueId = value['colorValueId'] as String?;
      if (colorValueId != null) {
        if (valueResolver != null) {
          final resolvedValue = valueResolver(colorValueId);
          // Recursively resolve the color
          return colorFromHex(
            resolvedValue,
            brightness: brightness,
            valueResolver: valueResolver,
          );
        }
        // If no valueResolver, return null (will be handled later)
        return null;
      }
    }

    // Handle theme-aware color object: { "light": "#FFFFFF", "dark": "#000000" }
    if (value.containsKey('light') || value.containsKey('dark')) {
      if (brightness != null) {
        String? hexString;

        if (brightness == Brightness.light && value.containsKey('light')) {
          hexString = value['light'] as String?;
        } else if (brightness == Brightness.dark && value.containsKey('dark')) {
          hexString = value['dark'] as String?;
        } else {
          // Fallback: use light if available, otherwise dark
          hexString = value['light'] as String? ?? value['dark'] as String?;
        }

        if (hexString != null) {
          // Recursively parse the hex string (in case it's also theme-aware)
          return colorFromHex(
            hexString,
            brightness: brightness,
            valueResolver: valueResolver,
          );
        }
      }
      // If brightness not provided, return null (will be resolved in Builder widget)
      return null;
    }
  }

  // Handle simple hex string
  if (value is String) {
    final hexString = value.replaceAll('#', '').toUpperCase();

    if (hexString.length == 6) {
      final fullHex = 'FF$hexString';
      try {
        return Color(int.parse(fullHex, radix: 16));
      } catch (e) {
        return null;
      }
    } else if (hexString.length == 8) {
      try {
        return Color(int.parse(hexString, radix: 16));
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  // Handle legacy integer format
  if (value is int || value is num) {
    return Color(value.toInt());
  }

  return null;
}

/// Helper function to resolve color with BuildContext
/// Use this in toWidget() methods when brightness wasn't available during parsing
Color? resolveColorWithContext(
  dynamic colorValue,
  BuildContext context, {
  dynamic Function(String)? valueResolver,
}) {
  if (colorValue == null) return null;

  final brightness = Theme.of(context).brightness;
  return colorFromHex(
    colorValue,
    brightness: brightness,
    valueResolver: valueResolver,
  );
}

class SizeValue {
  SizeValue({required this.value, this.isPercentage = false});

  factory SizeValue.fromJson(dynamic json) {
    if (json == null) return SizeValue(value: null);
    if (json is Map<String, dynamic>) {
      if (json.containsKey('percentage') || json.containsKey('type')) {
        final percentage = json['percentage'] as num? ?? json['value'] as num?;
        if (percentage != null) {
          return SizeValue(value: percentage.toDouble(), isPercentage: true);
        }
      }
      if (json.containsKey('value') && json['value'] != null) {
        final value = json['value'] as num?;
        if (value != null) {
          return SizeValue(value: value.toDouble());
        }
      }
    }
    if (json is num) {
      return SizeValue(value: json.toDouble());
    }
    if (json is String && json.endsWith('%')) {
      final percentage = double.tryParse(json.replaceAll('%', ''));
      if (percentage != null) {
        return SizeValue(value: percentage / 100.0, isPercentage: true);
      }
    }
    return SizeValue(value: null);
  }

  final double? value;
  final bool isPercentage;

  double? resolve(BuildContext context) {
    if (value == null) return null;
    if (!isPercentage) return value;
    final screenSize = MediaQuery.of(context).size;
    return value! * screenSize.width;
  }

  double? resolveHeight(BuildContext context) {
    if (value == null) return null;
    if (!isPercentage) return value;
    final screenSize = MediaQuery.of(context).size;
    return value! * screenSize.height;
  }

  Map<String, dynamic> toJson() {
    if (value == null) return {'value': null};
    if (isPercentage) {
      return {'percentage': value, 'type': 'percentage'};
    }
    return {'value': value};
  }
}
