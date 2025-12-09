import 'package:flutter/material.dart';

class ServerSpacer {
  ServerSpacer({
    this.key,
    this.flex = 1,
    this.widgetType = 'ServerSpacer',
  });

  factory ServerSpacer.fromJson(Map<String, dynamic> json) {
    return ServerSpacer(
      key: json['key'] != null ? Key(json['key']) : null,
      flex: json['flex'] ?? 1,
      widgetType: json['widgetType'] ?? 'ServerSpacer',
    );
  }

  final Key? key;
  final int flex;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'flex': flex,
    };
  }

  Widget toWidget() {
    return Spacer(
      key: key,
      flex: flex,
    );
  }
}

