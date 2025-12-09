import 'package:flutter/material.dart';

class ServerFittedBox {
  ServerFittedBox({
    this.key,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.hardEdge,
    this.child,
    this.widgetType = 'ServerFittedBox',
  });

  factory ServerFittedBox.fromJson(Map<String, dynamic> json) {
    return ServerFittedBox(
      key: json['key'] != null ? Key(json['key']) : null,
      fit: json['fit'] != null ? BoxFit.values[json['fit']] : BoxFit.contain,
      alignment: json['alignment'] != null
          ? Alignment(
              (json['alignment']['x'] as num?)?.toDouble() ?? 0.0,
              (json['alignment']['y'] as num?)?.toDouble() ?? 0.0,
            )
          : Alignment.center,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.hardEdge,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerFittedBox',
    );
  }

  final Key? key;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final alignmentValue = alignment is Alignment
        ? {'x': (alignment as Alignment).x, 'y': (alignment as Alignment).y}
        : {'x': 0.0, 'y': 0.0};
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'fit': fit.index,
      'alignment': alignmentValue,
      'clipBehavior': clipBehavior.index,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return FittedBox(
      key: key,
      fit: fit,
      alignment: alignment,
      clipBehavior: clipBehavior,
      child: childWidget,
    );
  }
}

