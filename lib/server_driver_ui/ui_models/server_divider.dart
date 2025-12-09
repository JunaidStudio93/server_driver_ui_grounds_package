import 'package:flutter/material.dart';

class ServerDivider {
  ServerDivider({
    this.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.widgetType = 'ServerDivider',
  });

  factory ServerDivider.fromJson(Map<String, dynamic> json) {
    return ServerDivider(
      key: json['key'] != null ? Key(json['key']) : null,
      height: (json['height'] as num?)?.toDouble(),
      thickness: (json['thickness'] as num?)?.toDouble(),
      indent: (json['indent'] as num?)?.toDouble(),
      endIndent: (json['endIndent'] as num?)?.toDouble(),
      color: json['color'] != null ? Color(json['color']) : null,
      widgetType: json['widgetType'] ?? 'ServerDivider',
    );
  }

  final Key? key;
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'height': height,
      'thickness': thickness,
      'indent': indent,
      'endIndent': endIndent,
      'color': color?.value,
    };
  }

  Widget toWidget() {
    return Divider(
      key: key,
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}

