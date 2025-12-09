import 'package:flutter/material.dart';

class ServerScrollConfiguration {
  ServerScrollConfiguration({
    required this.behavior,
    this.key,
    this.child,
    this.widgetType = 'ServerScrollConfiguration',
  });

  factory ServerScrollConfiguration.fromJson(Map<String, dynamic> json) {
    return ServerScrollConfiguration(
      behavior: json['behavior'] != null
          ? _parseScrollBehavior(json['behavior'] as String)
          : const ScrollBehavior(),
      key: json['key'] != null ? Key(json['key']) : null,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerScrollConfiguration',
    );
  }

  final ScrollBehavior behavior;
  final Key? key;
  final Map<String, dynamic>? child;
  final String widgetType;

  static ScrollBehavior _parseScrollBehavior(String behavior) {
    switch (behavior) {
      case 'topClamped':
        return const ScrollBehavior();
      case 'noScrollGlow':
        return const ScrollBehavior();
      default:
        return const ScrollBehavior();
    }
  }

  Map<String, dynamic> toJson() {
    String? behaviorString;
    // Since TopClampedScrollBehavior doesn't exist, treat all as default
    behaviorString = 'default';

    return {
      'widgetType': widgetType,
      'behavior': behaviorString,
      'key': key?.toString(),
      'child': child,
    };
  }

  ScrollConfiguration toWidget({Widget? childWidget}) {
    return ScrollConfiguration(
      key: key,
      behavior: behavior,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

