import 'package:flutter/material.dart';

class ServerGestureDetector {
  ServerGestureDetector({
    this.key,
    this.child,
    this.onTap,
    this.onLongPress,
    this.behavior,
    this.onTapActionId,
    this.onLongPressActionId,
    this.widgetType = 'ServerGestureDetector',
  });

  factory ServerGestureDetector.fromJson(Map<String, dynamic> json) {
    return ServerGestureDetector(
      key: json['key'] != null ? Key(json['key']) : null,
      child: json['child'],
      behavior: json['behavior'] != null
          ? HitTestBehavior.values[json['behavior']]
          : null,
      onTapActionId: json['onTapActionId'] as String?,
      onLongPressActionId: json['onLongPressActionId'] as String?,
      widgetType: json['widgetType'] ?? 'ServerGestureDetector',
    );
  }
  final Key? key;
  final Map<String, dynamic>? child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final HitTestBehavior? behavior;
  final String? onTapActionId;
  final String? onLongPressActionId;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'child': child,
      'behavior': behavior?.index,
      'onTapActionId': onTapActionId,
      'onLongPressActionId': onLongPressActionId,
    };
  }

  Widget toWidget({
    Widget? childWidget,
    VoidCallback? onTapCallback,
    VoidCallback? onLongPressCallback,
  }) {
    return GestureDetector(
      key: key,
      behavior: behavior,
      onTap: onTap ?? onTapCallback,
      onLongPress: onLongPress ?? onLongPressCallback,
      child: childWidget,
    );
  }
}
