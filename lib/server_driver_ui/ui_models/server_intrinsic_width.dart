import 'package:flutter/material.dart';

class ServerIntrinsicWidth {
  ServerIntrinsicWidth({
    this.key,
    this.stepWidth,
    required this.children,
    this.widgetType = 'ServerIntrinsicWidth',
  });

  factory ServerIntrinsicWidth.fromJson(Map<String, dynamic> json) {
    return ServerIntrinsicWidth(
      key: json['key'] != null ? Key(json['key']) : null,
      stepWidth: (json['stepWidth'] as num?)?.toDouble(),
      children: json['children'] ?? [],
      widgetType: json['widgetType'] ?? 'ServerIntrinsicWidth',
    );
  }

  final Key? key;
  final double? stepWidth;
  final List<Map<String, dynamic>> children;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'stepWidth': stepWidth,
      'children': children,
    };
  }

  Widget toWidget({required List<Widget> childWidgets}) {
    return IntrinsicWidth(
      key: key,
      stepWidth: stepWidth,
      child: Column(children: childWidgets),
    );
  }
}

