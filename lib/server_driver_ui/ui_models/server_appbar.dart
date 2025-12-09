import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_helper.dart';

class ServerAppBar {
  ServerAppBar({
    this.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.widgetType = 'ServerAppBar',
  });

  factory ServerAppBar.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final shapeJson = json['shape'];
    final iconThemeJson = json['iconTheme'];
    final actionsIconThemeJson = json['actionsIconTheme'];
    final toolbarTextStyleJson = json['toolbarTextStyle'];
    final titleTextStyleJson = json['titleTextStyle'];

    return ServerAppBar(
      key: json['key'] != null ? Key(json['key']) : null,
      leading: json['leading'],
      automaticallyImplyLeading: json['automaticallyImplyLeading'] ?? true,
      title: json['title'],
      actions: json['actions'] != null
          ? (json['actions'] as List)
                .map((item) => item as Map<String, dynamic>)
                .toList()
          : null,
      flexibleSpace: json['flexibleSpace'],
      bottom: json['bottom'],
      elevation: (json['elevation'] as num?)?.toDouble(),
      scrolledUnderElevation: (json['scrolledUnderElevation'] as num?)
          ?.toDouble(),
      shadowColor: colorFromHex(
        json['shadowColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      surfaceTintColor: colorFromHex(
        json['surfaceTintColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      shape: shapeJson != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                (shapeJson['borderRadius'] as num?)?.toDouble() ?? 0,
              ),
            )
          : null,
      backgroundColor: colorFromHex(
        json['backgroundColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      foregroundColor: colorFromHex(
        json['foregroundColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      iconTheme: iconThemeJson != null
          ? IconThemeData(
              color: colorFromHex(
                iconThemeJson['color'],
                brightness: brightness,
                valueResolver: valueResolver,
              ),
              opacity: (iconThemeJson['opacity'] as num?)?.toDouble(),
              size: (iconThemeJson['size'] as num?)?.toDouble(),
            )
          : null,
      actionsIconTheme: actionsIconThemeJson != null
          ? IconThemeData(
              color: colorFromHex(
                actionsIconThemeJson['color'],
                brightness: brightness,
                valueResolver: valueResolver,
              ),
              opacity: (actionsIconThemeJson['opacity'] as num?)?.toDouble(),
              size: (actionsIconThemeJson['size'] as num?)?.toDouble(),
            )
          : null,
      primary: json['primary'] ?? true,
      centerTitle: json['centerTitle'],
      excludeHeaderSemantics: json['excludeHeaderSemantics'] ?? false,
      titleSpacing: (json['titleSpacing'] as num?)?.toDouble(),
      toolbarOpacity: (json['toolbarOpacity'] as num?)?.toDouble() ?? 1.0,
      bottomOpacity: (json['bottomOpacity'] as num?)?.toDouble() ?? 1.0,
      toolbarHeight: (json['toolbarHeight'] as num?)?.toDouble(),
      leadingWidth: (json['leadingWidth'] as num?)?.toDouble(),
      toolbarTextStyle: toolbarTextStyleJson != null
          ? TextStyle(
              color: colorFromHex(
                toolbarTextStyleJson['color'],
                brightness: brightness,
                valueResolver: valueResolver,
              ),
              fontSize: (toolbarTextStyleJson['fontSize'] as num?)?.toDouble(),
              fontWeight: toolbarTextStyleJson['fontWeight'] != null
                  ? FontWeight.values[toolbarTextStyleJson['fontWeight']]
                  : null,
              fontStyle: toolbarTextStyleJson['fontStyle'] != null
                  ? FontStyle.values[toolbarTextStyleJson['fontStyle']]
                  : null,
            )
          : null,
      titleTextStyle: titleTextStyleJson != null
          ? TextStyle(
              color: colorFromHex(
                titleTextStyleJson['color'],
                brightness: brightness,
                valueResolver: valueResolver,
              ),
              fontSize: (titleTextStyleJson['fontSize'] as num?)?.toDouble(),
              fontWeight: titleTextStyleJson['fontWeight'] != null
                  ? FontWeight.values[titleTextStyleJson['fontWeight']]
                  : null,
              fontStyle: titleTextStyleJson['fontStyle'] != null
                  ? FontStyle.values[titleTextStyleJson['fontStyle']]
                  : null,
            )
          : null,
      systemOverlayStyle: json['systemOverlayStyle'] != null
          ? SystemUiOverlayStyle(
              statusBarColor: colorFromHex(
                json['systemOverlayStyle']['statusBarColor'],
              ),
              statusBarIconBrightness:
                  json['systemOverlayStyle']['statusBarIconBrightness'] != null
                  ? Brightness
                        .values[json['systemOverlayStyle']['statusBarIconBrightness']]
                  : null,
              statusBarBrightness:
                  json['systemOverlayStyle']['statusBarBrightness'] != null
                  ? Brightness
                        .values[json['systemOverlayStyle']['statusBarBrightness']]
                  : null,
              systemNavigationBarColor: colorFromHex(
                json['systemOverlayStyle']['systemNavigationBarColor'],
              ),
              systemNavigationBarDividerColor: colorFromHex(
                json['systemOverlayStyle']['systemNavigationBarDividerColor'],
              ),
              systemNavigationBarIconBrightness:
                  json['systemOverlayStyle']['systemNavigationBarIconBrightness'] !=
                      null
                  ? Brightness
                        .values[json['systemOverlayStyle']['systemNavigationBarIconBrightness']]
                  : null,
              systemNavigationBarContrastEnforced:
                  json['systemOverlayStyle']['systemNavigationBarContrastEnforced'],
              systemStatusBarContrastEnforced:
                  json['systemOverlayStyle']['systemStatusBarContrastEnforced'],
            )
          : null,
      widgetType: json['widgetType'] ?? 'ServerAppBar',
    );
  }

  final Key? key;
  final Map<String, dynamic>? leading;
  final bool automaticallyImplyLeading;
  final Map<String, dynamic>? title;
  final List<Map<String, dynamic>>? actions;
  final Map<String, dynamic>? flexibleSpace;
  final Map<String, dynamic>? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
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
          }
        : null;

    final iconThemeValue = iconTheme != null
        ? {
            'color': colorToHex(iconTheme!.color),
            'opacity': iconTheme!.opacity,
            'size': iconTheme!.size,
          }
        : null;

    final actionsIconThemeValue = actionsIconTheme != null
        ? {
            'color': colorToHex(actionsIconTheme!.color),
            'opacity': actionsIconTheme!.opacity,
            'size': actionsIconTheme!.size,
          }
        : null;

    final toolbarTextStyleValue = toolbarTextStyle != null
        ? {
            'color': colorToHex(toolbarTextStyle!.color),
            'fontSize': toolbarTextStyle!.fontSize,
            'fontWeight': toolbarTextStyle!.fontWeight?.index,
            'fontStyle': toolbarTextStyle!.fontStyle?.index,
          }
        : null;

    final titleTextStyleValue = titleTextStyle != null
        ? {
            'color': colorToHex(titleTextStyle!.color),
            'fontSize': titleTextStyle!.fontSize,
            'fontWeight': titleTextStyle!.fontWeight?.index,
            'fontStyle': titleTextStyle!.fontStyle?.index,
          }
        : null;

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'leading': leading,
      'automaticallyImplyLeading': automaticallyImplyLeading,
      'title': title,
      'actions': actions,
      'flexibleSpace': flexibleSpace,
      'bottom': bottom,
      'elevation': elevation,
      'scrolledUnderElevation': scrolledUnderElevation,
      'shadowColor': colorToHex(shadowColor),
      'surfaceTintColor': colorToHex(surfaceTintColor),
      'shape': shapeValue,
      'backgroundColor': colorToHex(backgroundColor),
      'foregroundColor': colorToHex(foregroundColor),
      'iconTheme': iconThemeValue,
      'actionsIconTheme': actionsIconThemeValue,
      'primary': primary,
      'centerTitle': centerTitle,
      'excludeHeaderSemantics': excludeHeaderSemantics,
      'titleSpacing': titleSpacing,
      'toolbarOpacity': toolbarOpacity,
      'bottomOpacity': bottomOpacity,
      'toolbarHeight': toolbarHeight,
      'leadingWidth': leadingWidth,
      'toolbarTextStyle': toolbarTextStyleValue,
      'titleTextStyle': titleTextStyleValue,
      'systemOverlayStyle': systemOverlayStyle != null
          ? {
              'statusBarColor': colorToHex(systemOverlayStyle!.statusBarColor),
              'statusBarIconBrightness':
                  systemOverlayStyle!.statusBarIconBrightness?.index,
              'statusBarBrightness':
                  systemOverlayStyle!.statusBarBrightness?.index,
              'systemNavigationBarColor': colorToHex(
                systemOverlayStyle!.systemNavigationBarColor,
              ),
              'systemNavigationBarDividerColor': colorToHex(
                systemOverlayStyle!.systemNavigationBarDividerColor,
              ),
              'systemNavigationBarIconBrightness':
                  systemOverlayStyle!.systemNavigationBarIconBrightness?.index,
              'systemNavigationBarContrastEnforced':
                  systemOverlayStyle!.systemNavigationBarContrastEnforced,
              'systemStatusBarContrastEnforced':
                  systemOverlayStyle!.systemStatusBarContrastEnforced,
            }
          : null,
    };
  }

  AppBar toWidget({
    Widget? leadingWidget,
    Widget? titleWidget,
    List<Widget>? actionsWidgets,
    Widget? flexibleSpaceWidget,
    PreferredSizeWidget? bottomWidget,
  }) {
    return AppBar(
      key: key,
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: titleWidget,
      actions: actionsWidgets,
      flexibleSpace: flexibleSpaceWidget,
      bottom: bottomWidget,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle,
    );
  }
}
