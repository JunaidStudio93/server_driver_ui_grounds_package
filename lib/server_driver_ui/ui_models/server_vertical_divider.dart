import 'package:flutter/material.dart';

class ServerVerticalDivider {
  ServerVerticalDivider({
    this.key,
    this.width,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.widgetType = 'ServerVerticalDivider',
  });

  factory ServerVerticalDivider.fromJson(Map<String, dynamic> json) {
    return ServerVerticalDivider(
      key: json['key'] != null ? Key(json['key']) : null,
      width: (json['width'] as num?)?.toDouble(),
      thickness: (json['thickness'] as num?)?.toDouble(),
      indent: (json['indent'] as num?)?.toDouble(),
      endIndent: (json['endIndent'] as num?)?.toDouble(),
      color: json['color'] != null ? Color(json['color']) : null,
      widgetType: json['widgetType'] ?? 'ServerVerticalDivider',
    );
  }

  final Key? key;
  final double? width;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'width': width,
      'thickness': thickness,
      'indent': indent,
      'endIndent': endIndent,
      'color': color?.value,
    };
  }

  VerticalDivider toWidget() {
    return VerticalDivider(
      key: key,
      width: width,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}

