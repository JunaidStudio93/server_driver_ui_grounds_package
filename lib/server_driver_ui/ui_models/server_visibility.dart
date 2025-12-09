import 'package:flutter/material.dart';

class ServerVisibility {
  ServerVisibility({
    this.key,
    required this.visible,
    this.maintainState = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
    this.maintainInteractivity = false,
    this.replacement,
    this.child,
    this.widgetType = 'ServerVisibility',
  });

  factory ServerVisibility.fromJson(Map<String, dynamic> json) {
    return ServerVisibility(
      key: json['key'] != null ? Key(json['key']) : null,
      visible: json['visible'] ?? true,
      maintainState: json['maintainState'] ?? false,
      maintainAnimation: json['maintainAnimation'] ?? false,
      maintainSize: json['maintainSize'] ?? false,
      maintainInteractivity: json['maintainInteractivity'] ?? false,
      replacement: json['replacement'] != null
          ? json['replacement'] as Map<String, dynamic>
          : null,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerVisibility',
    );
  }

  final Key? key;
  final bool visible;
  final bool maintainState;
  final bool maintainAnimation;
  final bool maintainSize;
  final bool maintainInteractivity;
  final Map<String, dynamic>? replacement;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'visible': visible,
      'maintainState': maintainState,
      'maintainAnimation': maintainAnimation,
      'maintainSize': maintainSize,
      'maintainInteractivity': maintainInteractivity,
      'replacement': replacement,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget, Widget? replacementWidget}) {
    return Visibility(
      key: key,
      visible: visible,
      maintainState: maintainState,
      maintainAnimation: maintainAnimation,
      maintainSize: maintainSize,
      maintainInteractivity: maintainInteractivity,
      replacement: replacementWidget ?? const SizedBox.shrink(),
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

