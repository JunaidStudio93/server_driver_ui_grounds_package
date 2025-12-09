import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerInkWell {
  ServerInkWell({
    this.key,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
    this.child,
    this.widgetType = 'ServerInkWell',
  });

  factory ServerInkWell.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final borderRadiusJson = json['borderRadius'];

    return ServerInkWell(
      key: json['key'] != null ? Key(json['key']) : null,
      onTap: json['onTap'] != null ? () {} : null,
      onDoubleTap: json['onDoubleTap'] != null ? () {} : null,
      onLongPress: json['onLongPress'] != null ? () {} : null,
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
      highlightColor: colorFromHex(
        json['highlightColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      splashColor: colorFromHex(
        json['splashColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      radius: (json['radius'] as num?)?.toDouble(),
      borderRadius: borderRadiusJson != null
          ? BorderRadius.circular(
              (borderRadiusJson['radius'] as num?)?.toDouble() ?? 0,
            )
          : null,
      enableFeedback: json['enableFeedback'] ?? true,
      excludeFromSemantics: json['excludeFromSemantics'] ?? false,
      canRequestFocus: json['canRequestFocus'] ?? true,
      autofocus: json['autofocus'] ?? false,
      onTapDown: json['onTapDown'] != null ? (details) {} : null,
      onTapUp: json['onTapUp'] != null ? (details) {} : null,
      onTapCancel: json['onTapCancel'] != null ? () {} : null,
      onHighlightChanged: json['onHighlightChanged'] != null
          ? (value) {}
          : null,
      onHover: json['onHover'] != null ? (value) {} : null,
      onFocusChange: json['onFocusChange'] != null ? (value) {} : null,
      mouseCursor: json['mouseCursor'] != null
          ? SystemMouseCursors.click
          : null,
      focusNode: json['focusNode'] != null ? FocusNode() : null,
      customBorder: json['customBorder'] != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                (json['customBorder']['borderRadius'] as num?)?.toDouble() ?? 0,
              ),
            )
          : null,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerInkWell',
    );
  }

  final Key? key;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final double? radius;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final bool enableFeedback;
  final bool excludeFromSemantics;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final bool autofocus;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'onTap': onTap != null ? true : null,
      'onDoubleTap': onDoubleTap != null ? true : null,
      'onLongPress': onLongPress != null ? true : null,
      'focusColor': colorToHex(focusColor),
      'hoverColor': colorToHex(hoverColor),
      'highlightColor': colorToHex(highlightColor),
      'splashColor': colorToHex(splashColor),
      'radius': radius,
      'borderRadius': borderRadius != null
          ? {'radius': borderRadius!.topLeft.x}
          : null,
      'enableFeedback': enableFeedback,
      'excludeFromSemantics': excludeFromSemantics,
      'canRequestFocus': canRequestFocus,
      'autofocus': autofocus,
      'onTapDown': onTapDown != null ? true : null,
      'onTapUp': onTapUp != null ? true : null,
      'onTapCancel': onTapCancel != null ? true : null,
      'onHighlightChanged': onHighlightChanged != null ? true : null,
      'onHover': onHover != null ? true : null,
      'onFocusChange': onFocusChange != null ? true : null,
      'mouseCursor': mouseCursor != null ? true : null,
      'focusNode': focusNode != null ? true : null,
      'customBorder': customBorder != null
          ? {
              'borderRadius':
                  (customBorder as RoundedRectangleBorder).borderRadius
                      is BorderRadius
                  ? ((customBorder as RoundedRectangleBorder).borderRadius
                            as BorderRadius)
                        .topLeft
                        .x
                  : 0,
            }
          : null,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return InkWell(
      key: key,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      autofocus: autofocus,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}
