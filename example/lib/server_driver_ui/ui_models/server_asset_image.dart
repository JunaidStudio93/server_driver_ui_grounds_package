import 'package:flutter/material.dart';
import 'package:example/server_driver_ui/ui_models/server_helper.dart';

class ServerImageAsset {
  ServerImageAsset({
    this.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.widgetType = 'ServerImageAsset',
  });

  factory ServerImageAsset.fromJson(Map<String, dynamic> json) {
    return ServerImageAsset(
      key: json['key'] != null ? Key(json['key']) : null,
      assetName: json['assetName'],
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      fit: json['fit'] != null ? BoxFit.values[json['fit']] : null,
      alignment: json['alignment'] != null
          ? Alignment(
              (json['alignment']['x'] as num?)?.toDouble() ?? 0,
              (json['alignment']['y'] as num?)?.toDouble() ?? 0,
            )
          : Alignment.center,
      widgetType: json['widgetType'] ?? 'ServerImageAsset',
    );
  }
  final Key? key;
  final String assetName;
  final SizeValue? width;
  final SizeValue? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final alignmentValue = alignment is Alignment
        ? {'x': (alignment as Alignment).x, 'y': (alignment as Alignment).y}
        : {'x': 0.0, 'y': 0.0};
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'assetName': assetName,
      'width': width?.toJson(),
      'height': height?.toJson(),
      'fit': fit?.index,
      'alignment': alignmentValue,
    };
  }

  Widget toWidget() {
    return Builder(
      builder: (context) {
        final resolvedWidth = width?.resolve(context);
        final resolvedHeight = height?.resolveHeight(context);
        return Image.asset(
          assetName,
          key: key,
          width: resolvedWidth,
          height: resolvedHeight,
          fit: fit,
          alignment: alignment,
        );
      },
    );
  }
}
