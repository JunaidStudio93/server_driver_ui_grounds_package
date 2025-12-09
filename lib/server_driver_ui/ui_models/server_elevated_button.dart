import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_helper.dart';

class ServerElevatedButton {
  ServerElevatedButton({
    this.key,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
    this.child,
    this.widgetType = 'ServerElevatedButton',
  });

  factory ServerElevatedButton.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final styleJson = json['style'];

    return ServerElevatedButton(
      key: json['key'] != null ? Key(json['key']) : null,
      onPressed: json['onPressed'] != null ? () {} : null,
      onLongPress: json['onLongPress'] != null ? () {} : null,
      autofocus: json['autofocus'] ?? false,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.none,
      child: json['child'],
      style: styleJson != null
          ? _parseButtonStyle(
              styleJson,
              brightness: brightness,
              valueResolver: valueResolver,
            )
          : null,
      widgetType: json['widgetType'] ?? 'ServerElevatedButton',
    );
  }

  static ButtonStyle? _parseButtonStyle(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    return ButtonStyle(
      backgroundColor: json['backgroundColor'] != null
          ? WidgetStateProperty.all(
              colorFromHex(
                    json['backgroundColor'],
                    brightness: brightness,
                    valueResolver: valueResolver,
                  ) ??
                  Colors.transparent,
            )
          : null,
      foregroundColor: json['foregroundColor'] != null
          ? WidgetStateProperty.all(
              colorFromHex(
                    json['foregroundColor'],
                    brightness: brightness,
                    valueResolver: valueResolver,
                  ) ??
                  Colors.transparent,
            )
          : null,
      overlayColor: json['overlayColor'] != null
          ? WidgetStateProperty.all(
              colorFromHex(
                    json['overlayColor'],
                    brightness: brightness,
                    valueResolver: valueResolver,
                  ) ??
                  Colors.transparent,
            )
          : null,
      shadowColor: json['shadowColor'] != null
          ? WidgetStateProperty.all(
              colorFromHex(
                    json['shadowColor'],
                    brightness: brightness,
                    valueResolver: valueResolver,
                  ) ??
                  Colors.transparent,
            )
          : null,
      elevation: json['elevation'] != null
          ? WidgetStateProperty.all((json['elevation'] as num).toDouble())
          : null,
      padding: json['padding'] != null
          ? WidgetStateProperty.all(
              EdgeInsets.fromLTRB(
                (json['padding']['left'] as num?)?.toDouble() ?? 0,
                (json['padding']['top'] as num?)?.toDouble() ?? 0,
                (json['padding']['right'] as num?)?.toDouble() ?? 0,
                (json['padding']['bottom'] as num?)?.toDouble() ?? 0,
              ),
            )
          : null,
      minimumSize: json['minimumSize'] != null
          ? WidgetStateProperty.all(
              Size(
                (json['minimumSize']['width'] as num?)?.toDouble() ?? 0,
                (json['minimumSize']['height'] as num?)?.toDouble() ?? 0,
              ),
            )
          : null,
      fixedSize: json['fixedSize'] != null
          ? WidgetStateProperty.all(
              Size(
                (json['fixedSize']['width'] as num?)?.toDouble() ?? 0,
                (json['fixedSize']['height'] as num?)?.toDouble() ?? 0,
              ),
            )
          : null,
      maximumSize: json['maximumSize'] != null
          ? WidgetStateProperty.all(
              Size(
                (json['maximumSize']['width'] as num?)?.toDouble() ??
                    double.infinity,
                (json['maximumSize']['height'] as num?)?.toDouble() ??
                    double.infinity,
              ),
            )
          : null,
      side: json['side'] != null
          ? WidgetStateProperty.all(
              BorderSide(
                color:
                    colorFromHex(
                      json['side']['color'],
                      brightness: brightness,
                      valueResolver: valueResolver,
                    ) ??
                    Colors.black,
                width: (json['side']['width'] as num?)?.toDouble() ?? 1.0,
              ),
            )
          : null,
      shape: json['shape'] != null
          ? WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  (json['shape']['borderRadius'] as num?)?.toDouble() ?? 0,
                ),
              ),
            )
          : null,
      textStyle: json['textStyle'] != null
          ? WidgetStateProperty.all(
              TextStyle(
                color: colorFromHex(
                  json['textStyle']['color'],
                  brightness: brightness,
                  valueResolver: valueResolver,
                ),
                fontSize: (json['textStyle']['fontSize'] as num?)?.toDouble(),
                fontWeight: json['textStyle']['fontWeight'] != null
                    ? FontWeight.values[json['textStyle']['fontWeight']]
                    : null,
              ),
            )
          : null,
      animationDuration: json['animationDuration'] != null
          ? Duration(milliseconds: json['animationDuration'])
          : null,
      enableFeedback: json['enableFeedback'],
      tapTargetSize: json['tapTargetSize'] != null
          ? MaterialTapTargetSize.values[json['tapTargetSize']]
          : null,
      visualDensity: json['visualDensity'] != null
          ? VisualDensity(
              horizontal:
                  (json['visualDensity']['horizontal'] as num?)?.toDouble() ??
                  0,
              vertical:
                  (json['visualDensity']['vertical'] as num?)?.toDouble() ?? 0,
            )
          : null,
    );
  }

  final Key? key;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final WidgetStatesController? statesController;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final styleValue = style != null ? _buttonStyleToJson(style!) : null;

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'onPressed': onPressed != null ? true : null,
      'onLongPress': onLongPress != null ? true : null,
      'autofocus': autofocus,
      'clipBehavior': clipBehavior.index,
      'style': styleValue,
      'child': child,
    };
  }

  Map<String, dynamic>? _buttonStyleToJson(ButtonStyle style) {
    final backgroundColor = style.backgroundColor?.resolve({});
    final foregroundColor = style.foregroundColor?.resolve({});
    final overlayColor = style.overlayColor?.resolve({});
    final shadowColor = style.shadowColor?.resolve({});
    final elevation = style.elevation?.resolve({});
    final padding = style.padding?.resolve({});
    final minimumSize = style.minimumSize?.resolve({});
    final fixedSize = style.fixedSize?.resolve({});
    final maximumSize = style.maximumSize?.resolve({});
    final side = style.side?.resolve({});
    final shape = style.shape?.resolve({});
    final textStyle = style.textStyle?.resolve({});
    final visualDensity = style.visualDensity;

    return {
      'backgroundColor': colorToHex(backgroundColor),
      'foregroundColor': colorToHex(foregroundColor),
      'overlayColor': colorToHex(overlayColor),
      'shadowColor': colorToHex(shadowColor),
      'elevation': elevation,
      'padding': padding != null
          ? {
              'left':
                  (padding is EdgeInsets
                          ? padding
                          : padding.resolve(TextDirection.ltr))
                      .left,
              'top':
                  (padding is EdgeInsets
                          ? padding
                          : padding.resolve(TextDirection.ltr))
                      .top,
              'right':
                  (padding is EdgeInsets
                          ? padding
                          : padding.resolve(TextDirection.ltr))
                      .right,
              'bottom':
                  (padding is EdgeInsets
                          ? padding
                          : padding.resolve(TextDirection.ltr))
                      .bottom,
            }
          : null,
      'minimumSize': minimumSize != null
          ? {'width': minimumSize.width, 'height': minimumSize.height}
          : null,
      'fixedSize': fixedSize != null
          ? {'width': fixedSize.width, 'height': fixedSize.height}
          : null,
      'maximumSize': maximumSize != null
          ? {
              'width': maximumSize.width == double.infinity
                  ? null
                  : maximumSize.width,
              'height': maximumSize.height == double.infinity
                  ? null
                  : maximumSize.height,
            }
          : null,
      'side': side != null
          ? {'color': colorToHex(side.color), 'width': side.width}
          : null,
      'shape': shape is RoundedRectangleBorder
          ? {'borderRadius': ((shape.borderRadius as BorderRadius).topLeft.x)}
          : null,
      'textStyle': textStyle != null
          ? {
              'color': colorToHex(textStyle.color),
              'fontSize': textStyle.fontSize,
              'fontWeight': textStyle.fontWeight?.index,
            }
          : null,
      'animationDuration': style.animationDuration?.inMilliseconds,
      'enableFeedback': style.enableFeedback,
      'tapTargetSize': style.tapTargetSize?.index,
      'visualDensity': visualDensity != null
          ? {
              'horizontal': visualDensity.horizontal,
              'vertical': visualDensity.vertical,
            }
          : null,
    };
  }

  Widget toWidget({Widget? childWidget, VoidCallback? onPressedCallback}) {
    return ElevatedButton(
      key: key,
      onPressed: onPressedCallback ?? onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}
