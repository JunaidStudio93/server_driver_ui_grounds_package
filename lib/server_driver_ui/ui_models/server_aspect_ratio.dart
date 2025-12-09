import 'package:flutter/material.dart';

class ServerAspectRatio {
  ServerAspectRatio({
    this.key,
    required this.aspectRatio,
    this.child,
    this.widgetType = 'ServerAspectRatio',
  });

  factory ServerAspectRatio.fromJson(Map<String, dynamic> json) {
    return ServerAspectRatio(
      key: json['key'] != null ? Key(json['key']) : null,
      aspectRatio: (json['aspectRatio'] as num?)?.toDouble() ?? 1.0,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerAspectRatio',
    );
  }

  final Key? key;
  final double aspectRatio;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'aspectRatio': aspectRatio,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return AspectRatio(
      key: key,
      aspectRatio: aspectRatio,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

