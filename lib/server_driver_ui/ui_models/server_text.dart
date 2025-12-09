import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_helper.dart';

class ServerText {
  ServerText({
    required this.data,
    this.dataValueId,
    this.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.widgetType = 'ServerText',
  });

  factory ServerText.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    return ServerText(
      data: json['data'] ?? '',
      dataValueId: json['dataValueId'] as String?,
      style: json['style'] != null
          ? ServerTextStyle.fromJson(
              json['style'],
              brightness: brightness,
              valueResolver: valueResolver,
            ).toTextStyle()
          : null,
      strutStyle: json['strutStyle'] != null
          ? ServerStrutStyle.fromJson(json['strutStyle']).toStrutStyle()
          : null,
      textAlign: json['textAlign'] != null
          ? TextAlign.values[json['textAlign']]
          : null,
      textDirection: json['textDirection'] != null
          ? TextDirection.values[json['textDirection']]
          : null,
      locale: json['locale'] != null
          ? Locale(
              json['locale']['languageCode'],
              json['locale']['countryCode'],
            )
          : null,
      softWrap: json['softWrap'],
      overflow: json['overflow'] != null
          ? TextOverflow.values[json['overflow']]
          : null,
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble(),
      maxLines: json['maxLines'],
      semanticsLabel: json['semanticsLabel'],
      textWidthBasis: json['textWidthBasis'] != null
          ? TextWidthBasis.values[json['textWidthBasis']]
          : null,
      textHeightBehavior: json['textHeightBehavior'] != null
          ? ServerTextHeightBehavior.fromJson(
              json['textHeightBehavior'],
            ).toTextHeightBehavior()
          : null,
      widgetType: json['widgetType'] ?? 'ServerText',
    );
  }
  String data;
  String? dataValueId;
  Key? key;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  TextOverflow? overflow;
  double? textScaleFactor;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'data': data,
      'dataValueId': dataValueId,
      'style': style != null
          ? ServerTextStyle.fromTextStyle(style!).toJson()
          : null,
      'strutStyle': strutStyle != null
          ? ServerStrutStyle.fromStrutStyle(strutStyle!).toJson()
          : null,
      'textAlign': textAlign?.index,
      'textDirection': textDirection?.index,
      'locale': locale != null
          ? {
              'languageCode': locale!.languageCode,
              'countryCode': locale!.countryCode,
            }
          : null,
      'softWrap': softWrap,
      'overflow': overflow?.index,
      'textScaleFactor': textScaleFactor,
      'maxLines': maxLines,
      'semanticsLabel': semanticsLabel,
      'textWidthBasis': textWidthBasis?.index,
      'textHeightBehavior': textHeightBehavior != null
          ? ServerTextHeightBehavior.fromTextHeightBehavior(
              textHeightBehavior!,
            ).toJson()
          : null,
    };
  }

  // Convert to Flutter Text widget
  Text toWidget({
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    return Text(
      data,
      key: key,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}

/// Helper class for TextStyle serialization
class ServerTextStyle {
  ServerTextStyle({
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
    this.decorationStyle,
    this.fontFamily,
    this.fontFamilyFallback,
    this.package,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.debugLabel,
    this.inherit = true,
    this.backgroundColor,
    this.foreground,
    this.baseline,
    this.leadingDistribution,
  });

  factory ServerTextStyle.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    TextDecoration? decoration;
    if (json['decoration'] != null) {
      final decorationMask = json['decoration'] as int;
      if (decorationMask == 0) {
        decoration = TextDecoration.none;
      } else {
        final decorations = <TextDecoration>[];
        if (decorationMask & 1 != 0) {
          decorations.add(TextDecoration.underline);
        }
        if (decorationMask & 2 != 0) {
          decorations.add(TextDecoration.overline);
        }
        if (decorationMask & 4 != 0) {
          decorations.add(TextDecoration.lineThrough);
        }
        decoration = decorations.isEmpty
            ? TextDecoration.none
            : decorations.length == 1
            ? decorations.first
            : TextDecoration.combine(decorations);
      }
    }

    TextDecorationStyle? decorationStyle;
    if (json['decorationStyle'] != null) {
      decorationStyle = TextDecorationStyle.values[json['decorationStyle']];
    }

    List<Shadow>? shadows;
    if (json['shadows'] != null) {
      shadows = (json['shadows'] as List).map((s) {
        final shadowColor = colorFromHex(
          s['color'],
          brightness: brightness,
          valueResolver: valueResolver,
        );
        return Shadow(
          color: shadowColor ?? Colors.black,
          offset: Offset(
            (s['offset']['dx'] as num?)?.toDouble() ?? 0,
            (s['offset']['dy'] as num?)?.toDouble() ?? 0,
          ),
          blurRadius: (s['blurRadius'] as num?)?.toDouble() ?? 0,
        );
      }).toList();
    }

    List<FontFeature>? fontFeatures;
    if (json['fontFeatures'] != null) {
      fontFeatures = (json['fontFeatures'] as List)
          .map((f) => FontFeature(f['feature'], f['value'] ?? 1))
          .toList();
    }

    List<FontVariation>? fontVariations;
    if (json['fontVariations'] != null) {
      fontVariations = (json['fontVariations'] as List)
          .map(
            (v) =>
                FontVariation(v['axis'], (v['value'] as num?)?.toDouble() ?? 0),
          )
          .toList();
    }

    return ServerTextStyle(
      color: colorFromHex(
        json['color'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] != null
          ? FontWeight.values[json['fontWeight']]
          : null,
      fontStyle: json['fontStyle'] != null
          ? FontStyle.values[json['fontStyle']]
          : null,
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      decoration: decoration,
      decorationColor: colorFromHex(
        json['decorationColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      decorationThickness: (json['decorationThickness'] as num?)?.toDouble(),
      decorationStyle: decorationStyle,
      fontFamily: json['fontFamily'],
      fontFamilyFallback: json['fontFamilyFallback'] != null
          ? List<String>.from(json['fontFamilyFallback'])
          : null,
      package: json['package'],
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      backgroundColor: colorFromHex(
        json['backgroundColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      foreground: json['foreground'] != null
          ? (Paint()
              ..color =
                  colorFromHex(
                    json['foreground'],
                    brightness: brightness,
                    valueResolver: valueResolver,
                  ) ??
                  Colors.black)
          : null,
      baseline: json['baseline'] != null
          ? TextBaseline.values[json['baseline']]
          : null,
      leadingDistribution: json['leadingDistribution'] != null
          ? TextLeadingDistribution.values[json['leadingDistribution']]
          : null,
      inherit: json['inherit'] ?? true,
    );
  }

  factory ServerTextStyle.fromTextStyle(TextStyle style) {
    return ServerTextStyle(
      color: style.color,
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      letterSpacing: style.letterSpacing,
      wordSpacing: style.wordSpacing,
      height: style.height,
      decoration: style.decoration,
      decorationColor: style.decorationColor,
      decorationThickness: style.decorationThickness,
      decorationStyle: style.decorationStyle,
      fontFamily: style.fontFamily,
      fontFamilyFallback: style.fontFamilyFallback,
      package: null, // TextStyle doesn't expose package as getter
      shadows: style.shadows,
      fontFeatures: style.fontFeatures,
      fontVariations: style.fontVariations,
      backgroundColor: style.backgroundColor,
      foreground: style.foreground,
      baseline: null, // TextStyle doesn't expose baseline as getter
      leadingDistribution: style.leadingDistribution,
      inherit: style.inherit,
    );
  }
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? letterSpacing;
  double? wordSpacing;
  double? height;
  TextDecoration? decoration;
  Color? decorationColor;
  double? decorationThickness;
  TextDecorationStyle? decorationStyle;
  String? fontFamily;
  List<String>? fontFamilyFallback;
  String? package;
  List<Shadow>? shadows;
  List<FontFeature>? fontFeatures;
  List<FontVariation>? fontVariations;
  String? debugLabel;
  bool inherit;
  Color? backgroundColor;
  Paint? foreground;
  TextBaseline? baseline;
  TextLeadingDistribution? leadingDistribution;

  Map<String, dynamic> toJson() {
    int? decorationMask;
    if (decoration != null) {
      decorationMask = 0;
      if (decoration == TextDecoration.none) {
        decorationMask = 0;
      } else {
        if (decoration!.contains(TextDecoration.underline)) {
          decorationMask = decorationMask | 1;
        }
        if (decoration!.contains(TextDecoration.overline)) {
          decorationMask = decorationMask | 2;
        }
        if (decoration!.contains(TextDecoration.lineThrough)) {
          decorationMask = decorationMask | 4;
        }
      }
    }

    return {
      'color': colorToHex(color),
      'fontSize': fontSize,
      'fontWeight': fontWeight?.index,
      'fontStyle': fontStyle?.index,
      'letterSpacing': letterSpacing,
      'wordSpacing': wordSpacing,
      'height': height,
      'decoration': decorationMask,
      'decorationColor': colorToHex(decorationColor),
      'decorationThickness': decorationThickness,
      'decorationStyle': decorationStyle?.index,
      'fontFamily': fontFamily,
      'fontFamilyFallback': fontFamilyFallback,
      'package': package,
      'shadows': shadows?.map(
        (s) => {
          'color': colorToHex(s.color),
          'offset': {'dx': s.offset.dx, 'dy': s.offset.dy},
          'blurRadius': s.blurRadius,
        },
      ),
      'fontFeatures': fontFeatures?.map(
        (f) => {'feature': f.feature, 'value': f.value},
      ),
      'fontVariations': fontVariations?.map(
        (v) => {'axis': v.axis, 'value': v.value},
      ),
      'backgroundColor': colorToHex(backgroundColor),
      'foreground': colorToHex(foreground?.color),
      'baseline': baseline?.index,
      'leadingDistribution': leadingDistribution?.index,
      'inherit': inherit,
    };
  }

  TextStyle toTextStyle() {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
      decorationStyle: decorationStyle,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      backgroundColor: backgroundColor,
      foreground: foreground,
      leadingDistribution: leadingDistribution,
      inherit: inherit,
    );
  }
}

/// Helper class for StrutStyle serialization
class ServerStrutStyle {
  ServerStrutStyle({
    this.fontSize,
    this.height,
    this.leading,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.forceStrutHeight,
    this.leadingDistribution,
  });

  factory ServerStrutStyle.fromJson(Map<String, dynamic> json) {
    return ServerStrutStyle(
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      leading: (json['leading'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] != null
          ? FontWeight.values[json['fontWeight']]
          : null,
      fontStyle: json['fontStyle'] != null
          ? FontStyle.values[json['fontStyle']]
          : null,
      fontFamily: json['fontFamily'],
      forceStrutHeight: json['forceStrutHeight'],
      leadingDistribution: json['leadingDistribution'] != null
          ? TextLeadingDistribution.values[json['leadingDistribution']]
          : null,
    );
  }

  factory ServerStrutStyle.fromStrutStyle(StrutStyle style) {
    return ServerStrutStyle(
      fontSize: style.fontSize,
      height: style.height,
      leading: style.leading,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      fontFamily: style.fontFamily,
      forceStrutHeight: style.forceStrutHeight,
      leadingDistribution: style.leadingDistribution,
    );
  }
  double? fontSize;
  double? height;
  double? leading;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  String? fontFamily;
  bool? forceStrutHeight;
  TextLeadingDistribution? leadingDistribution;

  Map<String, dynamic> toJson() {
    return {
      'fontSize': fontSize,
      'height': height,
      'leading': leading,
      'fontWeight': fontWeight?.index,
      'fontStyle': fontStyle?.index,
      'fontFamily': fontFamily,
      'forceStrutHeight': forceStrutHeight,
      'leadingDistribution': leadingDistribution?.index,
    };
  }

  StrutStyle toStrutStyle() {
    return StrutStyle(
      fontSize: fontSize,
      height: height,
      leading: leading,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      forceStrutHeight: forceStrutHeight ?? false,
      leadingDistribution:
          leadingDistribution ?? TextLeadingDistribution.proportional,
    );
  }
}

/// Helper class for TextHeightBehavior serialization
class ServerTextHeightBehavior {
  ServerTextHeightBehavior({
    this.applyHeightToFirstAscent,
    this.applyHeightToLastDescent,
  });

  factory ServerTextHeightBehavior.fromJson(Map<String, dynamic> json) {
    return ServerTextHeightBehavior(
      applyHeightToFirstAscent: json['applyHeightToFirstAscent'],
      applyHeightToLastDescent: json['applyHeightToLastDescent'],
    );
  }

  factory ServerTextHeightBehavior.fromTextHeightBehavior(
    TextHeightBehavior behavior,
  ) {
    return ServerTextHeightBehavior(
      applyHeightToFirstAscent: behavior.applyHeightToFirstAscent,
      applyHeightToLastDescent: behavior.applyHeightToLastDescent,
    );
  }
  bool? applyHeightToFirstAscent;
  bool? applyHeightToLastDescent;
  TextHeightBehavior? copyWithBehavior;

  Map<String, dynamic> toJson() {
    return {
      'applyHeightToFirstAscent': applyHeightToFirstAscent,
      'applyHeightToLastDescent': applyHeightToLastDescent,
    };
  }

  TextHeightBehavior toTextHeightBehavior() {
    return TextHeightBehavior(
      applyHeightToFirstAscent: applyHeightToFirstAscent ?? true,
      applyHeightToLastDescent: applyHeightToLastDescent ?? true,
    );
  }
}
