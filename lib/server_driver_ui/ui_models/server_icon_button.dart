import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerIconButton {
  ServerIconButton({
    this.key,
    required this.icon,
    this.iconSize,
    this.visualDensity,
    this.padding,
    this.alignment,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.onPressed,
    this.onLongPress,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
    this.style,
    this.isSelected,
    this.selectedIcon,
    this.widgetType = 'ServerIconButton',
  });

  factory ServerIconButton.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final iconJson = json['icon'];
    final paddingJson = json['padding'];
    final constraintsJson = json['constraints'];
    final styleJson = json['style'];
    final selectedIconJson = json['selectedIcon'];

    IconData? iconData;
    if (iconJson != null) {
      if (iconJson['codePoint'] != null) {
        iconData = IconData(
          iconJson['codePoint'],
          fontFamily: iconJson['fontFamily'],
          fontPackage: iconJson['fontPackage'],
        );
      }
    }

    IconData? selectedIconData;
    if (selectedIconJson != null) {
      if (selectedIconJson['codePoint'] != null) {
        selectedIconData = IconData(
          selectedIconJson['codePoint'],
          fontFamily: selectedIconJson['fontFamily'],
          fontPackage: selectedIconJson['fontPackage'],
        );
      }
    }

    return ServerIconButton(
      key: json['key'] != null ? Key(json['key']) : null,
      icon: iconData ?? Icons.help_outline,
      iconSize: (json['iconSize'] as num?)?.toDouble(),
      visualDensity: json['visualDensity'] != null
          ? VisualDensity(
              horizontal:
                  (json['visualDensity']['horizontal'] as num?)?.toDouble() ??
                  0,
              vertical:
                  (json['visualDensity']['vertical'] as num?)?.toDouble() ?? 0,
            )
          : null,
      padding: paddingJson != null
          ? EdgeInsets.fromLTRB(
              (paddingJson['left'] as num?)?.toDouble() ?? 0,
              (paddingJson['top'] as num?)?.toDouble() ?? 0,
              (paddingJson['right'] as num?)?.toDouble() ?? 0,
              (paddingJson['bottom'] as num?)?.toDouble() ?? 0,
            )
          : null,
      alignment: json['alignment'] != null
          ? Alignment(
              (json['alignment']['x'] as num?)?.toDouble() ?? 0,
              (json['alignment']['y'] as num?)?.toDouble() ?? 0,
            )
          : null,
      splashRadius: (json['splashRadius'] as num?)?.toDouble(),
      color: colorFromHex(
        json['color'],
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
      disabledColor: colorFromHex(
        json['disabledColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      onPressed: json['onPressed'] != null ? () {} : null,
      onLongPress: json['onLongPress'] != null ? () {} : null,
      autofocus: json['autofocus'] ?? false,
      tooltip: json['tooltip'],
      enableFeedback: json['enableFeedback'] ?? true,
      constraints: constraintsJson != null
          ? BoxConstraints(
              minWidth: (constraintsJson['minWidth'] as num?)?.toDouble() ?? 0,
              maxWidth:
                  (constraintsJson['maxWidth'] as num?)?.toDouble() ??
                  double.infinity,
              minHeight:
                  (constraintsJson['minHeight'] as num?)?.toDouble() ?? 0,
              maxHeight:
                  (constraintsJson['maxHeight'] as num?)?.toDouble() ??
                  double.infinity,
            )
          : null,
      style: styleJson != null
          ? _parseIconButtonStyle(
              styleJson,
              brightness: brightness,
              valueResolver: valueResolver,
            )
          : null,
      isSelected: json['isSelected'],
      selectedIcon: selectedIconData,
      widgetType: json['widgetType'] ?? 'ServerIconButton',
    );
  }

  static IconButtonThemeData? _parseIconButtonStyle(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    return IconButtonThemeData(
      style: ButtonStyle(
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
      ),
    );
  }

  final Key? key;
  final IconData icon;
  final double? iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? splashRadius;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool enableFeedback;
  final BoxConstraints? constraints;
  final IconButtonThemeData? style;
  final bool? isSelected;
  final IconData? selectedIcon;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final visualDensityValue = visualDensity != null
        ? {
            'horizontal': visualDensity!.horizontal,
            'vertical': visualDensity!.vertical,
          }
        : null;

    final paddingValue = padding != null
        ? () {
            final resolved = padding! is EdgeInsets
                ? padding! as EdgeInsets
                : padding!.resolve(TextDirection.ltr);
            return {
              'left': resolved.left,
              'top': resolved.top,
              'right': resolved.right,
              'bottom': resolved.bottom,
            };
          }()
        : null;

    final alignmentValue = alignment != null
        ? {
            'x': alignment!.resolve(TextDirection.ltr).x,
            'y': alignment!.resolve(TextDirection.ltr).y,
          }
        : null;

    final constraintsValue = constraints != null
        ? {
            'minWidth': constraints!.minWidth,
            'maxWidth': constraints!.maxWidth == double.infinity
                ? null
                : constraints!.maxWidth,
            'minHeight': constraints!.minHeight,
            'maxHeight': constraints!.maxHeight == double.infinity
                ? null
                : constraints!.maxHeight,
          }
        : null;

    final styleValue = style?.style != null
        ? () {
            final buttonStyle = style!.style!;
            final bgColor = buttonStyle.backgroundColor?.resolve({});
            final fgColor = buttonStyle.foregroundColor?.resolve({});
            final overlay = buttonStyle.overlayColor?.resolve({});
            return {
              'backgroundColor': colorToHex(bgColor),
              'foregroundColor': colorToHex(fgColor),
              'overlayColor': colorToHex(overlay),
              'padding': buttonStyle.padding?.resolve({}) != null
                  ? () {
                      final padding =
                          buttonStyle.padding!.resolve({})
                              as EdgeInsetsGeometry;
                      final resolved = padding is EdgeInsets
                          ? padding
                          : padding.resolve(TextDirection.ltr);
                      return {
                        'left': resolved.left,
                        'top': resolved.top,
                        'right': resolved.right,
                        'bottom': resolved.bottom,
                      };
                    }()
                  : null,
            };
          }()
        : null;

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'icon': {
        'codePoint': icon.codePoint,
        'fontFamily': icon.fontFamily,
        'fontPackage': icon.fontPackage,
      },
      'iconSize': iconSize,
      'visualDensity': visualDensityValue,
      'padding': paddingValue,
      'alignment': alignmentValue,
      'splashRadius': splashRadius,
      'color': color?.value,
      'focusColor': focusColor?.value,
      'hoverColor': hoverColor?.value,
      'highlightColor': highlightColor?.value,
      'splashColor': splashColor?.value,
      'disabledColor': disabledColor?.value,
      'onPressed': onPressed != null ? true : null,
      'onLongPress': onLongPress != null ? true : null,
      'autofocus': autofocus,
      'tooltip': tooltip,
      'enableFeedback': enableFeedback,
      'constraints': constraintsValue,
      'style': styleValue,
      'isSelected': isSelected,
      'selectedIcon': selectedIcon != null
          ? {
              'codePoint': selectedIcon!.codePoint,
              'fontFamily': selectedIcon!.fontFamily,
              'fontPackage': selectedIcon!.fontPackage,
            }
          : null,
    };
  }

  Widget toWidget({VoidCallback? onPressedCallback}) {
    return IconButton(
      key: key,
      icon: Icon(icon),
      iconSize: iconSize,
      visualDensity: visualDensity,
      padding: padding,
      alignment: alignment,
      splashRadius: splashRadius,
      color: color,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      onPressed: onPressedCallback ?? onPressed,
      onLongPress: onLongPress,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      autofocus: autofocus,
      tooltip: tooltip,
      enableFeedback: enableFeedback,
      constraints: constraints,
      style: style?.style,
      isSelected: isSelected,
      selectedIcon: selectedIcon != null ? Icon(selectedIcon) : null,
    );
  }
}
