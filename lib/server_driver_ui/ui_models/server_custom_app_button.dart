import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerCustomAppButton {
  ServerCustomAppButton({
    required this.buttonText,
    this.width,
    this.height,
    this.buttonColor = Colors.blue,
    this.buttonTextColor = Colors.white,
    this.showLoader = false,
    this.iconName,
    this.suffixIconName,
    this.iconColor = Colors.white,
    this.textSize = 16,
    this.textFontWeight = FontWeight.w700,
    this.showBorder = false,
    this.borderColor = Colors.grey,
    this.disableColor,
    this.minSize,
    this.padding,
    this.textLetterSpacing,
    this.suffixIconSize,
    this.disabledTextColor,
    this.hasSuffixWidget = false,
    this.onTapActionId,
    this.widgetType = 'ServerCustomAppButton',
  });

  factory ServerCustomAppButton.fromJson(Map<String, dynamic> json) {
    return ServerCustomAppButton(
      buttonText: json['buttonText'],
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      buttonColor: colorFromHex(json['buttonColor']) ?? Colors.blue,
      buttonTextColor: colorFromHex(json['buttonTextColor']) ?? Colors.white,
      showLoader: json['showLoader'] ?? false,
      iconName: json['iconName'],
      suffixIconName: json['suffixIconName'],
      iconColor: colorFromHex(json['iconColor']) ?? Colors.white,
      textSize: (json['textSize'] as num?)?.toDouble() ?? 16,
      textFontWeight:
          json['textFontWeight'] != null &&
              json['textFontWeight'] is int &&
              json['textFontWeight'] >= 0 &&
              json['textFontWeight'] < FontWeight.values.length
          ? FontWeight.values[json['textFontWeight']]
          : FontWeight.w700,
      showBorder: json['showBorder'] ?? false,
      borderColor: colorFromHex(json['borderColor']) ?? Colors.grey,
      disableColor: colorFromHex(json['disableColor']),
      minSize: (json['minSize'] as num?)?.toDouble(),
      padding: json['padding'] != null
          ? EdgeInsets.fromLTRB(
              (json['padding']['left'] as num?)?.toDouble() ?? 0,
              (json['padding']['top'] as num?)?.toDouble() ?? 0,
              (json['padding']['right'] as num?)?.toDouble() ?? 0,
              (json['padding']['bottom'] as num?)?.toDouble() ?? 0,
            )
          : null,
      textLetterSpacing: (json['textLetterSpacing'] as num?)?.toDouble(),
      suffixIconSize: (json['suffixIconSize'] as num?)?.toDouble(),
      disabledTextColor: colorFromHex(json['disabledTextColor']),
      hasSuffixWidget: json['hasSuffixWidget'] ?? false,
      onTapActionId: json['onTapActionId'] as String?,
      widgetType: json['widgetType'] ?? 'ServerCustomAppButton',
    );
  }
  final String buttonText;
  final SizeValue? width;
  final SizeValue? height;
  final Color buttonColor;
  final Color buttonTextColor;
  final bool showLoader;
  final String? iconName;
  final String? suffixIconName;
  final Color iconColor;
  final double textSize;
  final FontWeight textFontWeight;
  final bool showBorder;
  final Color borderColor;
  final Color? disableColor;
  final double? minSize;
  final EdgeInsetsGeometry? padding;
  final double? textLetterSpacing;
  final double? suffixIconSize;
  final Color? disabledTextColor;
  final bool hasSuffixWidget;
  final String? onTapActionId;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'buttonText': buttonText,
      'width': width?.toJson(),
      'height': height?.toJson(),
      'buttonColor': colorToHex(buttonColor),
      'buttonTextColor': colorToHex(buttonTextColor),
      'showLoader': showLoader,
      'iconName': iconName,
      'suffixIconName': suffixIconName,
      'iconColor': colorToHex(iconColor),
      'textSize': textSize,
      'textFontWeight': textFontWeight.index,
      'showBorder': showBorder,
      'borderColor': colorToHex(borderColor),
      'disableColor': colorToHex(disableColor),
      'minSize': minSize,
      'padding': padding != null
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
          : null,
      'textLetterSpacing': textLetterSpacing,
      'suffixIconSize': suffixIconSize,
      'disabledTextColor': colorToHex(disabledTextColor),
      'hasSuffixWidget': hasSuffixWidget,
      'onTapActionId': onTapActionId,
    };
  }

  Widget toWidget({
    VoidCallback? onTap,
    Widget? iconWidget,
    Widget? suffixIconWidget,
    Widget? suffixWidget,
  }) {
    final needsContext =
        (width?.isPercentage ?? false) || (height?.isPercentage ?? false);

    Widget buildButton() {
      final buttonContent = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconWidget != null) ...[iconWidget, const SizedBox(width: 10)],
          Text(
            buttonText,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: textFontWeight,
              color: !showLoader
                  ? buttonTextColor
                  : disabledTextColor ?? Colors.grey,
              letterSpacing: textLetterSpacing,
            ),
          ),
          if (suffixIconWidget != null) ...[
            const SizedBox(width: 10),
            suffixIconWidget,
          ],
          if (suffixWidget != null) ...[
            const SizedBox(width: 10),
            suffixWidget,
          ],
        ],
      );

      final isEnabled = !showLoader;
      final effectiveColor = isEnabled
          ? buttonColor
          : (disableColor ?? buttonColor.withOpacity(0.5));

      Widget button = Container(
        decoration: BoxDecoration(
          color: effectiveColor,
          borderRadius: BorderRadius.circular(8),
          border: showBorder ? Border.all(color: borderColor) : null,
        ),
        constraints: minSize != null
            ? BoxConstraints(minWidth: minSize!, minHeight: minSize!)
            : null,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isEnabled ? onTap : null,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: buttonContent,
            ),
          ),
        ),
      );

      return button;
    }

    if (needsContext) {
      return Builder(
        builder: (context) {
          final resolvedWidth = width?.resolve(context);
          final resolvedHeight = height?.resolveHeight(context);
          final button = buildButton();
          return SizedBox(
            width: resolvedWidth,
            height: resolvedHeight,
            child: button,
          );
        },
      );
    } else {
      final resolvedWidth = width?.value;
      final resolvedHeight = height?.value;
      final button = buildButton();
      if (resolvedWidth != null || resolvedHeight != null) {
        return SizedBox(
          width: resolvedWidth,
          height: resolvedHeight,
          child: button,
        );
      }
      return button;
    }
  }
}
