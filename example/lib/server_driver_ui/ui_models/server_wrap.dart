import 'package:flutter/material.dart';

class ServerWrap {
  ServerWrap({
    this.key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.children,
    this.widgetType = 'ServerWrap',
  });

  factory ServerWrap.fromJson(Map<String, dynamic> json) {
    return ServerWrap(
      key: json['key'] != null ? Key(json['key']) : null,
      direction: json['direction'] != null
          ? Axis.values[json['direction']]
          : Axis.horizontal,
      alignment: json['alignment'] != null
          ? WrapAlignment.values[json['alignment']]
          : WrapAlignment.start,
      spacing: (json['spacing'] as num?)?.toDouble() ?? 0.0,
      runAlignment: json['runAlignment'] != null
          ? WrapAlignment.values[json['runAlignment']]
          : WrapAlignment.start,
      runSpacing: (json['runSpacing'] as num?)?.toDouble() ?? 0.0,
      crossAxisAlignment: json['crossAxisAlignment'] != null
          ? WrapCrossAlignment.values[json['crossAxisAlignment']]
          : WrapCrossAlignment.start,
      textDirection: json['textDirection'] != null
          ? TextDirection.values[json['textDirection']]
          : null,
      verticalDirection: json['verticalDirection'] != null
          ? VerticalDirection.values[json['verticalDirection']]
          : VerticalDirection.down,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.none,
      children: json['children'],
      widgetType: json['widgetType'] ?? 'ServerWrap',
    );
  }

  final Key? key;
  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;
  final List<Map<String, dynamic>>? children;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'direction': direction.index,
      'alignment': alignment.index,
      'spacing': spacing,
      'runAlignment': runAlignment.index,
      'runSpacing': runSpacing,
      'crossAxisAlignment': crossAxisAlignment.index,
      'textDirection': textDirection?.index,
      'verticalDirection': verticalDirection.index,
      'clipBehavior': clipBehavior.index,
      'children': children,
    };
  }

  Widget toWidget({List<Widget>? childrenWidgets}) {
    return Wrap(
      key: key,
      direction: direction,
      alignment: alignment,
      spacing: spacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: childrenWidgets ?? [],
    );
  }
}

