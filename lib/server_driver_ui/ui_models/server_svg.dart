import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerSvgAsset {
  ServerSvgAsset({
    this.key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.widgetType = 'ServerSvgAsset',
  });

  factory ServerSvgAsset.fromJson(Map<String, dynamic> json) {
    return ServerSvgAsset(
      key: json['key'] != null ? Key(json['key']) : null,
      assetName: json['assetName'],
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      color: json['color'] != null ? Color(json['color']) : null,
      fit: json['fit'] != null ? BoxFit.values[json['fit']] : BoxFit.contain,
      alignment: json['alignment'] != null
          ? Alignment(
              (json['alignment']['x'] as num?)?.toDouble() ?? 0,
              (json['alignment']['y'] as num?)?.toDouble() ?? 0,
            )
          : Alignment.center,
      widgetType: json['widgetType'] ?? 'ServerSvgAsset',
    );
  }
  final Key? key;
  final String assetName;
  final SizeValue? width;
  final SizeValue? height;
  final Color? color;
  final BoxFit fit;
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
      'color': color?.value,
      'fit': fit.index,
      'alignment': alignmentValue,
    };
  }

  Widget toWidget() {
    return Builder(
      builder: (context) {
        final resolvedWidth = width?.resolve(context);
        final resolvedHeight = height?.resolveHeight(context);
        double iconSize = 24.0;
        if (resolvedWidth != null && resolvedHeight != null) {
          iconSize = resolvedWidth < resolvedHeight
              ? resolvedWidth
              : resolvedHeight;
        }

        try {
          return SvgPicture.asset(
            assetName,
            key: key,
            width: resolvedWidth,
            height: resolvedHeight,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            fit: fit,
            alignment: alignment,
            placeholderBuilder: (context) {
              return Container(
                width: resolvedWidth,
                height: resolvedHeight,
                color: Colors.grey[200],
                child: Icon(
                  Icons.image,
                  color: Colors.grey[400],
                  size: iconSize,
                ),
              );
            },
          );
        } catch (e, stackTrace) {
          debugPrint('Error loading SVG asset: $assetName');
          debugPrint('Error: $e');
          debugPrint('Stack trace: $stackTrace');
          return Container(
            width: resolvedWidth,
            height: resolvedHeight,
            color: Colors.grey[300],
            child: Icon(
              Icons.broken_image,
              color: Colors.grey[600],
              size: iconSize,
            ),
          );
        }
      },
    );
  }
}
