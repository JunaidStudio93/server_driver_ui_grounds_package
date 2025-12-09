import 'package:flutter/material.dart';
import 'package:example/server_driver_ui/ui_models/server_helper.dart';

class ServerFloatingActionButton {
  ServerFloatingActionButton({
    this.key,
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.onPressed,
    this.mouseCursor,
    this.mini = false,
    this.shape,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
    this.isExtended = false,
    this.materialTapTargetSize,
    this.extendedSizeConstraints,
    this.extendedPadding,
    this.extendedIconLabelSpacing,
    this.widgetType = 'ServerFloatingActionButton',
  });

  factory ServerFloatingActionButton.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final shapeJson = json['shape'];
    final extendedPaddingJson = json['extendedPadding'];

    return ServerFloatingActionButton(
      key: json['key'] != null ? Key(json['key']) : null,
      child: json['child'],
      tooltip: json['tooltip'],
      foregroundColor: colorFromHex(
        json['foregroundColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      backgroundColor: colorFromHex(
        json['backgroundColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      focusColor: colorFromHex(
        json['focusColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      hoverColor: colorFromHex(
        json['hoverColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      splashColor: colorFromHex(
        json['splashColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      heroTag: json['heroTag'],
      elevation: (json['elevation'] as num?)?.toDouble(),
      focusElevation: (json['focusElevation'] as num?)?.toDouble(),
      hoverElevation: (json['hoverElevation'] as num?)?.toDouble(),
      highlightElevation: (json['highlightElevation'] as num?)?.toDouble(),
      disabledElevation: (json['disabledElevation'] as num?)?.toDouble(),
      onPressed: json['onPressed'] != null ? () {} : null,
      mini: json['mini'] ?? false,
      shape: shapeJson != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                (shapeJson['borderRadius'] as num?)?.toDouble() ?? 0,
              ),
            )
          : shapeJson != null && shapeJson['type'] == 'CircleBorder'
          ? const CircleBorder()
          : null,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.none,
      autofocus: json['autofocus'] ?? false,
      isExtended: json['isExtended'] ?? false,
      materialTapTargetSize: json['materialTapTargetSize'] != null
          ? MaterialTapTargetSize.values[json['materialTapTargetSize']]
          : null,
      extendedPadding: extendedPaddingJson != null
          ? EdgeInsets.fromLTRB(
              (extendedPaddingJson['left'] as num?)?.toDouble() ?? 0,
              (extendedPaddingJson['top'] as num?)?.toDouble() ?? 0,
              (extendedPaddingJson['right'] as num?)?.toDouble() ?? 0,
              (extendedPaddingJson['bottom'] as num?)?.toDouble() ?? 0,
            )
          : null,
      extendedIconLabelSpacing: (json['extendedIconLabelSpacing'] as num?)
          ?.toDouble(),
      widgetType: json['widgetType'] ?? 'ServerFloatingActionButton',
    );
  }

  final Key? key;
  final Map<String, dynamic>? child;
  final String? tooltip;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Object? heroTag;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final VoidCallback? onPressed;
  final MouseCursor? mouseCursor;
  final bool mini;
  final ShapeBorder? shape;
  final Clip clipBehavior;
  final bool autofocus;
  final bool isExtended;
  final MaterialTapTargetSize? materialTapTargetSize;
  final BoxConstraints? extendedSizeConstraints;
  final EdgeInsetsGeometry? extendedPadding;
  final double? extendedIconLabelSpacing;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final shapeValue = shape is RoundedRectangleBorder
        ? {
            'type': 'RoundedRectangleBorder',
            'borderRadius':
                (shape as RoundedRectangleBorder).borderRadius is BorderRadius
                ? ((shape as RoundedRectangleBorder).borderRadius
                          as BorderRadius)
                      .topLeft
                      .x
                : 0,
          }
        : shape is CircleBorder
        ? {'type': 'CircleBorder'}
        : null;

    final extendedPaddingValue = extendedPadding != null
        ? () {
            final resolved = extendedPadding! is EdgeInsets
                ? extendedPadding! as EdgeInsets
                : extendedPadding!.resolve(TextDirection.ltr);
            return {
              'left': resolved.left,
              'top': resolved.top,
              'right': resolved.right,
              'bottom': resolved.bottom,
            };
          }()
        : null;

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'child': child,
      'tooltip': tooltip,
      'foregroundColor': colorToHex(foregroundColor),
      'backgroundColor': colorToHex(backgroundColor),
      'focusColor': colorToHex(focusColor),
      'hoverColor': colorToHex(hoverColor),
      'splashColor': colorToHex(splashColor),
      'heroTag': heroTag?.toString(),
      'elevation': elevation,
      'focusElevation': focusElevation,
      'hoverElevation': hoverElevation,
      'highlightElevation': highlightElevation,
      'disabledElevation': disabledElevation,
      'onPressed': onPressed != null ? true : null,
      'mini': mini,
      'shape': shapeValue,
      'clipBehavior': clipBehavior.index,
      'autofocus': autofocus,
      'isExtended': isExtended,
      'materialTapTargetSize': materialTapTargetSize?.index,
      'extendedPadding': extendedPaddingValue,
      'extendedIconLabelSpacing': extendedIconLabelSpacing,
    };
  }

  Widget toWidget({Widget? childWidget, VoidCallback? onPressedCallback}) {
    if (isExtended) {
      // For extended FAB, childWidget should contain both icon and label
      // We'll use childWidget as label for now
      return FloatingActionButton.extended(
        key: key,
        onPressed: onPressedCallback ?? onPressed,
        tooltip: tooltip,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        splashColor: splashColor,
        heroTag: heroTag,
        elevation: elevation,
        focusElevation: focusElevation,
        hoverElevation: hoverElevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        mouseCursor: mouseCursor,
        materialTapTargetSize: materialTapTargetSize,
        extendedPadding: extendedPadding,
        extendedIconLabelSpacing: extendedIconLabelSpacing,
        autofocus: autofocus,
        label: childWidget ?? const SizedBox.shrink(),
        icon: null, // Icon can be part of childWidget
      );
    }

    return FloatingActionButton(
      key: key,
      onPressed: onPressedCallback ?? onPressed,
      tooltip: tooltip,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      heroTag: heroTag,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      mouseCursor: mouseCursor,
      mini: mini,
      shape: shape,
      clipBehavior: clipBehavior,
      autofocus: autofocus,
      materialTapTargetSize: materialTapTargetSize,
      child: childWidget,
    );
  }
}
