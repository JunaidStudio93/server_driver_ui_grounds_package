import 'package:flutter/material.dart';

class ServerAlign {
  ServerAlign({
    this.key,
    this.alignment = Alignment.center,
    this.child,
    this.widthFactor,
    this.heightFactor,
    this.widgetType = 'ServerAlign',
  });

  factory ServerAlign.fromJson(Map<String, dynamic> json) {
    final a = json['alignment'];
    return ServerAlign(
      key: json['key'] != null ? Key(json['key']) : null,
      alignment: a != null
          ? Alignment(
              (a['x'] as num?)?.toDouble() ?? 0,
              (a['y'] as num?)?.toDouble() ?? 0,
            )
          : Alignment.center,
      widthFactor: (json['widthFactor'] as num?)?.toDouble(),
      heightFactor: (json['heightFactor'] as num?)?.toDouble(),
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerAlign',
    );
  }

  final Key? key;
  final AlignmentGeometry alignment;
  final Map<String, dynamic>? child;
  final double? widthFactor;
  final double? heightFactor;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final resolvedAlignment = alignment is Alignment
        ? alignment as Alignment
        : alignment.resolve(TextDirection.ltr);
    final alignmentValue = {
      'x': resolvedAlignment.x,
      'y': resolvedAlignment.y,
    };
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'alignment': alignmentValue,
      'widthFactor': widthFactor,
      'heightFactor': heightFactor,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Align(
      key: key,
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: childWidget,
    );
  }
}

