import 'package:flutter/material.dart';

class ServerPositioned {
  ServerPositioned({
    this.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.child,
    this.widgetType = 'ServerPositioned',
  });

  factory ServerPositioned.fromJson(Map<String, dynamic> json) {
    return ServerPositioned(
      key: json['key'] != null ? Key(json['key']) : null,
      left: (json['left'] as num?)?.toDouble(),
      top: (json['top'] as num?)?.toDouble(),
      right: (json['right'] as num?)?.toDouble(),
      bottom: (json['bottom'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerPositioned',
    );
  }

  final Key? key;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
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
      'width': width,
      'height': height,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Positioned(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

