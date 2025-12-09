import 'package:flutter/material.dart';

class ServerStack {
  ServerStack({
    this.key,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.fit = StackFit.loose,
    this.clipBehavior = Clip.hardEdge,
    required this.children,
    this.widgetType = 'ServerStack',
  });

  factory ServerStack.fromJson(Map<String, dynamic> json) {
    AlignmentGeometry? parsedAlignment;
    if (json['alignment'] != null) {
      final alignmentData = json['alignment'] as Map<String, dynamic>;
      if (alignmentData.containsKey('start')) {
        parsedAlignment = AlignmentDirectional(
          alignmentData['start']?.toDouble() ?? 0.0,
          alignmentData['y']?.toDouble() ?? 0.0,
        );
      } else {
        parsedAlignment = Alignment(
          alignmentData['x']?.toDouble() ?? 0.0,
          alignmentData['y']?.toDouble() ?? 0.0,
        );
      }
    }

    return ServerStack(
      key: json['key'] != null ? Key(json['key']) : null,
      alignment: parsedAlignment ?? AlignmentDirectional.topStart,
      textDirection: json['textDirection'] != null
          ? TextDirection.values[json['textDirection']]
          : null,
      fit: json['fit'] != null ? StackFit.values[json['fit']] : StackFit.loose,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.hardEdge,
      children: json['children'] ?? [],
      widgetType: json['widgetType'] ?? 'ServerStack',
    );
  }

  final Key? key;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final StackFit fit;
  final Clip clipBehavior;
  final List<Map<String, dynamic>> children;
  final String widgetType;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> alignmentJson;
    if (alignment is Alignment) {
      final align = alignment as Alignment;
      alignmentJson = {
        'x': align.x,
        'y': align.y,
      };
    } else if (alignment is AlignmentDirectional) {
      final align = alignment as AlignmentDirectional;
      alignmentJson = {
        'start': align.start,
        'y': align.y,
      };
    } else {
      alignmentJson = {
        'x': 0.0,
        'y': 0.0,
      };
    }

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'alignment': alignmentJson,
      'textDirection': textDirection?.index,
      'fit': fit.index,
      'clipBehavior': clipBehavior.index,
      'children': children,
    };
  }

  Stack toWidget({List<Widget>? childWidgets}) {
    return Stack(
      key: key,
      alignment: alignment,
      textDirection: textDirection,
      fit: fit,
      clipBehavior: clipBehavior,
      children: childWidgets ?? [],
    );
  }
}
