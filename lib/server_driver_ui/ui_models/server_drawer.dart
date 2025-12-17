import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerDrawer {
  ServerDrawer({
    this.key,
    this.elevation,
    this.backgroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.semanticLabel,
    this.width,
    this.child,
    this.shape,
    this.clipBehavior = Clip.none,
    this.widgetType = 'ServerDrawer',
  });

  factory ServerDrawer.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final shapeJson = json['shape'];

    return ServerDrawer(
      key: json['key'] != null ? Key(json['key']) : null,
      elevation: (json['elevation'] as num?)?.toDouble(),
      backgroundColor: colorFromHex(
        json['backgroundColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      surfaceTintColor: colorFromHex(
        json['surfaceTintColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      shadowColor: colorFromHex(
        json['shadowColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      semanticLabel: json['semanticLabel'],
      width: (json['width'] as num?)?.toDouble(),
      child: json['child'],
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
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.none,
      widgetType: json['widgetType'] ?? 'ServerDrawer',
    );
  }

  final Key? key;
  final double? elevation;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final String? semanticLabel;
  final double? width;
  final Map<String, dynamic>? child;
  final ShapeBorder? shape;
  final Clip clipBehavior;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final shapeValue = shape is RoundedRectangleBorder
        ? {
            'borderRadius':
                (shape as RoundedRectangleBorder).borderRadius is BorderRadius
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
      'elevation': elevation,
      'backgroundColor': colorToHex(backgroundColor),
      'surfaceTintColor': colorToHex(surfaceTintColor),
      'shadowColor': colorToHex(shadowColor),
      'semanticLabel': semanticLabel,
      'width': width,
      'child': child,
      'shape': shapeValue,
      'clipBehavior': clipBehavior.index,
    };
  }

  Drawer toWidget({Widget? childWidget}) {
    return Drawer(
      key: key,
      elevation: elevation,
      backgroundColor: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      semanticLabel: semanticLabel,
      width: width,
      shape: shape,
      clipBehavior: clipBehavior,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}
