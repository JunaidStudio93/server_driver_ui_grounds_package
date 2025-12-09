import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

enum SpaceDirection { horizontal, vertical, both }

class ServerSpace {
  ServerSpace._({this.width, this.height, this.widgetType = 'ServerSpace'});

  factory ServerSpace.horizontal(SizeValue value) {
    return ServerSpace._(width: value != 0 ? value : null, height: null);
  }

  factory ServerSpace.vertical(SizeValue value) {
    return ServerSpace._(width: null, height: value != 0 ? value : null);
  }

  factory ServerSpace.both({double width = 0, double height = 0}) {
    return ServerSpace._(
      width: width != 0 ? SizeValue(value: width) : null,
      height: height != 0 ? SizeValue(value: height) : null,
    );
  }

  factory ServerSpace() {
    return ServerSpace._(width: null, height: null);
  }

  factory ServerSpace.fromJson(Map<String, dynamic> json) {
    return ServerSpace._(
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      widgetType: json['widgetType'] ?? 'ServerSpace',
    );
  }

  final SizeValue? width;
  final SizeValue? height;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'width': width?.toJson(),
      'height': height?.toJson(),
    };
  }

  Widget toWidget() {
    return Builder(
      builder: (context) {
        final resolvedWidth = width?.resolve(context);
        final resolvedHeight = height?.resolveHeight(context);
        return SizedBox(width: resolvedWidth, height: resolvedHeight);
      },
    );
  }
}
