import 'dart:io';
import 'package:flutter/material.dart';

class ServerPlatform {
  ServerPlatform({
    required this.platform,
    this.key,
    this.child,
    this.fallback,
    this.widgetType = 'ServerPlatform',
  });

  factory ServerPlatform.fromJson(Map<String, dynamic> json) {
    return ServerPlatform(
      platform: json['platform'] ?? 'all',
      key: json['key'] != null ? Key(json['key']) : null,
      child: json['child'],
      fallback: json['fallback'],
      widgetType: json['widgetType'] ?? 'ServerPlatform',
    );
  }

  final String platform;
  final Key? key;
  final Map<String, dynamic>? child;
  final Map<String, dynamic>? fallback;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'platform': platform,
      'key': key?.toString(),
      'child': child,
      'fallback': fallback,
    };
  }

  Widget toWidget({
    Widget? childWidget,
    Widget? fallbackWidget,
  }) {
    final isTargetPlatform = _isTargetPlatform(platform);
    
    if (isTargetPlatform) {
      return childWidget ?? const SizedBox.shrink();
    } else {
      return fallbackWidget ?? const SizedBox.shrink();
    }
  }

  bool _isTargetPlatform(String platform) {
    switch (platform.toLowerCase()) {
      case 'ios':
        return Platform.isIOS;
      case 'android':
        return Platform.isAndroid;
      case 'all':
        return true;
      default:
        return true;
    }
  }
}

