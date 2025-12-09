import 'package:flutter/material.dart';

class ServerIntrinsicHeight {
  ServerIntrinsicHeight({
    this.key,
    this.stepHeight,
    required this.children,
    this.widgetType = 'ServerIntrinsicHeight',
  });

  factory ServerIntrinsicHeight.fromJson(Map<String, dynamic> json) {
    return ServerIntrinsicHeight(
      key: json['key'] != null ? Key(json['key']) : null,
      stepHeight: (json['stepHeight'] as num?)?.toDouble(),
      children: json['children'] ?? [],
      widgetType: json['widgetType'] ?? 'ServerIntrinsicHeight',
    );
  }

  final Key? key;
  final double? stepHeight;
  final List<Map<String, dynamic>> children;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'stepHeight': stepHeight,
      'children': children,
    };
  }

  Widget toWidget({required List<Widget> childWidgets}) {
    return IntrinsicHeight(
      key: key,
      child: Column(children: childWidgets),
    );
  }
}

