import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerSizedBox {
  ServerSizedBox({
    this.key,
    this.width,
    this.height,
    this.child,
    this.widgetType = 'ServerSizedBox',
  });

  factory ServerSizedBox.fromJson(Map<String, dynamic> json) {
    return ServerSizedBox(
      key: json['key'] != null ? Key(json['key']) : null,
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerSizedBox',
    );
  }
  final Key? key;
  final SizeValue? width;
  final SizeValue? height;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    String? keyValue;
    final currentKey = key;
    if (currentKey != null) {
      if (currentKey is ValueKey) {
        keyValue = currentKey.value?.toString();
      } else {
        keyValue = currentKey.toString();
      }
    }
    return {
      'widgetType': widgetType,
      'key': keyValue,
      'width': width?.toJson(),
      'height': height?.toJson(),
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Builder(
      builder: (context) {
        final resolvedWidth = width?.resolve(context);
        final resolvedHeight = height?.resolveHeight(context);
        return SizedBox(
          key: key,
          width: resolvedWidth,
          height: resolvedHeight,
          child: childWidget,
        );
      },
    );
  }
}
