import 'package:flutter/material.dart';

class ServerWillPopScope {
  ServerWillPopScope({
    required this.onWillPop,
    this.key,
    this.child,
    this.widgetType = 'ServerWillPopScope',
  });

  factory ServerWillPopScope.fromJson(Map<String, dynamic> json) {
    return ServerWillPopScope(
      onWillPop: json['onWillPop'] != null
          ? json['onWillPop'] as bool
          : true,
      key: json['key'] != null ? Key(json['key']) : null,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerWillPopScope',
    );
  }

  final bool onWillPop;
  final Key? key;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'onWillPop': onWillPop,
      'key': key?.toString(),
      'child': child,
    };
  }

  WillPopScope toWidget({
    Widget? childWidget,
    required Future<bool> Function() onWillPopCallback,
  }) {
    return WillPopScope(
      key: key,
      onWillPop: onWillPopCallback,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

