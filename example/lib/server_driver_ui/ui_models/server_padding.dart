import 'package:flutter/material.dart';

class ServerPadding {
  ServerPadding({
    this.key,
    required this.padding,
    this.child,
    this.widgetType = 'ServerPadding',
  });

  factory ServerPadding.fromJson(Map<String, dynamic> json) {
    final p = json['padding'];
    return ServerPadding(
      key: json['key'] != null ? Key(json['key']) : null,
      padding: EdgeInsets.fromLTRB(
        (p['left'] as num?)?.toDouble() ?? 0,
        (p['top'] as num?)?.toDouble() ?? 0,
        (p['right'] as num?)?.toDouble() ?? 0,
        (p['bottom'] as num?)?.toDouble() ?? 0,
      ),
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerPadding',
    );
  }

  final Key? key;
  final EdgeInsetsGeometry padding;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'padding': edgeInsetsToJson(padding),
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Padding(
      key: key,
      padding: padding,
      child: childWidget,
    );
  }

  static Map<String, dynamic> edgeInsetsToJson(EdgeInsetsGeometry edgeInsets) {
    final resolved = edgeInsets is EdgeInsets
        ? edgeInsets
        : edgeInsets.resolve(TextDirection.ltr);
    return {
      'left': resolved.left,
      'top': resolved.top,
      'right': resolved.right,
      'bottom': resolved.bottom,
    };
  }
}

