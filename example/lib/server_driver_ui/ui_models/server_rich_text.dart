import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:example/server_driver_ui/ui_models/server_text.dart';

class ServerRichText {
  ServerRichText({
    required this.text,
    this.key,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.widgetType = 'ServerRichText',
  });

  factory ServerRichText.fromJson(Map<String, dynamic> json) {
    return ServerRichText(
      text: json['text'] != null
          ? ServerTextSpan.fromJson(json['text']).toTextSpan()
          : const TextSpan(text: ''),
      key: json['key'] != null ? Key(json['key']) : null,
      textAlign: json['textAlign'] != null
          ? TextAlign.values[json['textAlign']]
          : null,
      textDirection: json['textDirection'] != null
          ? TextDirection.values[json['textDirection']]
          : null,
      softWrap: json['softWrap'],
      overflow: json['overflow'] != null
          ? TextOverflow.values[json['overflow']]
          : null,
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble(),
      maxLines: json['maxLines'],
      locale: json['locale'] != null
          ? Locale(
              json['locale']['languageCode'],
              json['locale']['countryCode'],
            )
          : null,
      strutStyle: json['strutStyle'] != null
          ? ServerStrutStyle.fromJson(json['strutStyle']).toStrutStyle()
          : null,
      textWidthBasis: json['textWidthBasis'] != null
          ? TextWidthBasis.values[json['textWidthBasis']]
          : null,
      textHeightBehavior: json['textHeightBehavior'] != null
          ? ServerTextHeightBehavior.fromJson(
              json['textHeightBehavior'],
            ).toTextHeightBehavior()
          : null,
      selectionColor: json['selectionColor'] != null
          ? Color(json['selectionColor'])
          : null,
      widgetType: json['widgetType'] ?? 'ServerRichText',
    );
  }

  final TextSpan text;
  final Key? key;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'text': ServerTextSpan.fromTextSpan(text).toJson(),
      'key': key?.toString(),
      'textAlign': textAlign?.index,
      'textDirection': textDirection?.index,
      'softWrap': softWrap,
      'overflow': overflow?.index,
      'textScaleFactor': textScaleFactor,
      'maxLines': maxLines,
      'locale': locale != null
          ? {
              'languageCode': locale!.languageCode,
              'countryCode': locale!.countryCode,
            }
          : null,
      'strutStyle': strutStyle != null
          ? ServerStrutStyle.fromStrutStyle(strutStyle!).toJson()
          : null,
      'textWidthBasis': textWidthBasis?.index,
      'textHeightBehavior': textHeightBehavior != null
          ? ServerTextHeightBehavior.fromTextHeightBehavior(
              textHeightBehavior!,
            ).toJson()
          : null,
      'selectionColor': selectionColor?.value,
    };
  }

  RichText toWidget() {
    return RichText(
      key: key,
      text: text,
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textScaleFactor: textScaleFactor ?? 1.0,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}

class ServerTextSpan {
  ServerTextSpan({
    this.text,
    this.children,
    this.style,
    this.recognizer,
    this.semanticsLabel,
    this.mouseCursor,
    this.onEnter,
    this.onExit,
    this.spellOut,
  });

  factory ServerTextSpan.fromJson(Map<String, dynamic> json) {
    final children = json['children'] != null
        ? (json['children'] as List)
              .map(
                (child) =>
                    ServerTextSpan.fromJson(child as Map<String, dynamic>),
              )
              .toList()
        : null;

    return ServerTextSpan(
      text: json['text'],
      children: children?.map((c) => c.toTextSpan()).toList(),
      style: json['style'] != null
          ? ServerTextStyle.fromJson(json['style']).toTextStyle()
          : null,
      semanticsLabel: json['semanticsLabel'],
      spellOut: json['spellOut'],
    );
  }

  factory ServerTextSpan.fromTextSpan(TextSpan span) {
    return ServerTextSpan(
      text: span.text,
      children: span.children?.whereType<TextSpan>().map((c) {
        return ServerTextSpan.fromTextSpan(c).toTextSpan();
      }).toList(),
      style: span.style,
      recognizer: span.recognizer,
      semanticsLabel: span.semanticsLabel,
      mouseCursor: span.mouseCursor,
      spellOut: span.spellOut,
    );
  }

  final String? text;
  final List<TextSpan>? children;
  final TextStyle? style;
  final GestureRecognizer? recognizer;
  final String? semanticsLabel;
  final MouseCursor? mouseCursor;
  final VoidCallback? onEnter;
  final VoidCallback? onExit;
  final bool? spellOut;

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'children': children
          ?.map((c) => ServerTextSpan.fromTextSpan(c).toJson())
          .toList(),
      'style': style != null
          ? ServerTextStyle.fromTextStyle(style!).toJson()
          : null,
      'semanticsLabel': semanticsLabel,
      'spellOut': spellOut,
    };
  }

  TextSpan toTextSpan() {
    return TextSpan(
      text: text,
      children: children,
      style: style,
      recognizer: recognizer,
      semanticsLabel: semanticsLabel,
      mouseCursor: mouseCursor,
      spellOut: spellOut,
    );
  }
}
