import 'package:flutter/material.dart';

class ServerSafeArea {
  ServerSafeArea({
    this.key,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
    this.child,
    this.widgetType = 'ServerSafeArea',
  });

  factory ServerSafeArea.fromJson(Map<String, dynamic> json) {
    final minimumJson = json['minimum'];
    return ServerSafeArea(
      key: json['key'] != null ? Key(json['key']) : null,
      left: json['left'] ?? true,
      top: json['top'] ?? true,
      right: json['right'] ?? true,
      bottom: json['bottom'] ?? true,
      minimum: minimumJson != null
          ? EdgeInsets.fromLTRB(
              (minimumJson['left'] as num?)?.toDouble() ?? 0,
              (minimumJson['top'] as num?)?.toDouble() ?? 0,
              (minimumJson['right'] as num?)?.toDouble() ?? 0,
              (minimumJson['bottom'] as num?)?.toDouble() ?? 0,
            )
          : EdgeInsets.zero,
      maintainBottomViewPadding: json['maintainBottomViewPadding'] ?? false,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerSafeArea',
    );
  }

  final Key? key;
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'left': left,
      'top': top,
      'right': right,
      'bottom': bottom,
      'minimum': {
        'left': minimum.left,
        'top': minimum.top,
        'right': minimum.right,
        'bottom': minimum.bottom,
      },
      'maintainBottomViewPadding': maintainBottomViewPadding,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return SafeArea(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

