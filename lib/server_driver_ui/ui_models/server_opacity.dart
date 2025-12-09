import 'package:flutter/material.dart';

class ServerOpacity {
  ServerOpacity({
    this.key,
    required this.opacity,
    this.alwaysIncludeSemantics = false,
    this.child,
    this.widgetType = 'ServerOpacity',
  });

  factory ServerOpacity.fromJson(Map<String, dynamic> json) {
    return ServerOpacity(
      key: json['key'] != null ? Key(json['key']) : null,
      opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
      alwaysIncludeSemantics: json['alwaysIncludeSemantics'] ?? false,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerOpacity',
    );
  }

  final Key? key;
  final double opacity;
  final bool alwaysIncludeSemantics;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'opacity': opacity,
      'alwaysIncludeSemantics': alwaysIncludeSemantics,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Opacity(
      key: key,
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

