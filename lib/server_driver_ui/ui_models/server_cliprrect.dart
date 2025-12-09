import 'package:flutter/material.dart';

class ServerClipRRect {
  ServerClipRRect({
    this.key,
    this.borderRadius = BorderRadius.zero,
    this.clipBehavior = Clip.hardEdge,
    this.child,
    this.widgetType = 'ServerClipRRect',
  });

  factory ServerClipRRect.fromJson(Map<String, dynamic> json) {
    final br = json['borderRadius'];
    return ServerClipRRect(
      key: json['key'] != null ? Key(json['key']) : null,
      borderRadius: br != null
          ? BorderRadius.circular((br['radius'] as num?)?.toDouble() ?? 0)
          : BorderRadius.zero,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.hardEdge,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerClipRRect',
    );
  }
  final Key? key;
  final BorderRadiusGeometry borderRadius;
  final Clip clipBehavior;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'borderRadius': {'radius': (borderRadius as BorderRadius).topLeft.x},
      'clipBehavior': clipBehavior.index,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return ClipRRect(
      key: key,
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: childWidget,
    );
  }
}
