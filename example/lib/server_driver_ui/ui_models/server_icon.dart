import 'package:flutter/material.dart';

class ServerIcon {
  ServerIcon({
    this.key,
    required this.icon,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    this.widgetType = 'ServerIcon',
  });

  factory ServerIcon.fromJson(Map<String, dynamic> json) {
    IconData? iconData;
    if (json['icon'] != null) {
      final iconJson = json['icon'];
      if (iconJson['codePoint'] != null) {
        iconData = IconData(
          iconJson['codePoint'],
          fontFamily: iconJson['fontFamily'],
          fontPackage: iconJson['fontPackage'],
        );
      }
    }

    return ServerIcon(
      key: json['key'] != null ? Key(json['key']) : null,
      icon: iconData ?? Icons.help_outline,
      size: (json['size'] as num?)?.toDouble(),
      color: json['color'] != null ? Color(json['color']) : null,
      semanticLabel: json['semanticLabel'],
      textDirection: json['textDirection'] != null
          ? TextDirection.values[json['textDirection']]
          : null,
      widgetType: json['widgetType'] ?? 'ServerIcon',
    );
  }

  final Key? key;
  final IconData icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'icon': {
        'codePoint': icon.codePoint,
        'fontFamily': icon.fontFamily,
        'fontPackage': icon.fontPackage,
      },
      'size': size,
      'color': color?.value,
      'semanticLabel': semanticLabel,
      'textDirection': textDirection?.index,
    };
  }

  Widget toWidget() {
    return Icon(
      key: key,
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}

