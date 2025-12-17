import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerCard {
  ServerCard({
    this.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
    this.widgetType = 'ServerCard',
  });

  factory ServerCard.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final marginJson = json['margin'];
    final shapeJson = json['shape'];

    return ServerCard(
      key: json['key'] != null ? Key(json['key']) : null,
      color: json['color'] != null ? Color(json['color']) : null,
      shadowColor: json['shadowColor'] != null
          ? Color(json['shadowColor'])
          : null,
      surfaceTintColor: json['surfaceTintColor'] != null
          ? Color(json['surfaceTintColor'])
          : null,
      elevation: (json['elevation'] as num?)?.toDouble(),
      shape: shapeJson != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                (shapeJson['borderRadius'] as num?)?.toDouble() ?? 0,
              ),
              side: shapeJson['side'] != null
                  ? BorderSide(
                      color: colorFromHex(
                            shapeJson['side']['color'],
                            brightness: brightness,
                            valueResolver: valueResolver,
                          ) ??
                          Colors.black,
                      width: (shapeJson['side']['width'] as num?)?.toDouble() ??
                          1.0,
                    )
                  : BorderSide.none,
            )
          : null,
      borderOnForeground: json['borderOnForeground'] ?? true,
      margin: marginJson != null
          ? EdgeInsets.fromLTRB(
              (marginJson['left'] as num?)?.toDouble() ?? 0,
              (marginJson['top'] as num?)?.toDouble() ?? 0,
              (marginJson['right'] as num?)?.toDouble() ?? 0,
              (marginJson['bottom'] as num?)?.toDouble() ?? 0,
            )
          : null,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : null,
      child: json['child'],
      semanticContainer: json['semanticContainer'] ?? true,
      widgetType: json['widgetType'] ?? 'ServerCard',
    );
  }

  final Key? key;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final Map<String, dynamic>? child;
  final bool semanticContainer;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final marginValue = margin != null
        ? () {
            final resolved = margin! is EdgeInsets
                ? margin! as EdgeInsets
                : margin!.resolve(TextDirection.ltr);
            return {
              'left': resolved.left,
              'top': resolved.top,
              'right': resolved.right,
              'bottom': resolved.bottom,
            };
          }()
        : null;

    final shapeValue = shape is RoundedRectangleBorder
        ? {
            'borderRadius': (shape as RoundedRectangleBorder)
                        .borderRadius is BorderRadius
                    ? ((shape as RoundedRectangleBorder).borderRadius
                            as BorderRadius)
                        .topLeft
                        .x
                    : 0,
            'side': (shape as RoundedRectangleBorder).side != BorderSide.none
                ? {
                    'color': colorToHex((shape as RoundedRectangleBorder).side.color),
                    'width': (shape as RoundedRectangleBorder).side.width,
                  }
                : null,
          }
        : null;

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'color': color?.value,
      'shadowColor': shadowColor?.value,
      'surfaceTintColor': surfaceTintColor?.value,
      'elevation': elevation,
      'shape': shapeValue,
      'borderOnForeground': borderOnForeground,
      'margin': marginValue,
      'clipBehavior': clipBehavior?.index,
      'child': child,
      'semanticContainer': semanticContainer,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Card(
      key: key,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      child: childWidget,
    );
  }
}

