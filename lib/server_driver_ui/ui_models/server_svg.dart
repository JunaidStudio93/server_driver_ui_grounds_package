import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

enum ServerSvgType { asset, network }

class ServerSvgAsset {
  ServerSvgAsset({
    this.key,
    this.assetName,
    this.src,
    this.type = ServerSvgType.asset,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.widgetType = 'ServerSvgAsset',
  }) : assert(
         assetName != null || src != null,
         'Either assetName or src must be provided',
       );

  factory ServerSvgAsset.fromJson(Map<String, dynamic> json) {
    // Determine type: if explicitly provided, use it; otherwise default to asset
    final type = json['type'] != null
        ? ServerSvgType.values[json['type']]
        : ServerSvgType.asset;

    // Support both assetName (legacy) and src (new, more generic)
    final src = json['src'] ?? json['assetName'];

    return ServerSvgAsset(
      key: json['key'] != null ? Key(json['key']) : null,
      assetName: json['assetName'],
      src: src,
      type: type,
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
  final String? assetName; // Legacy field, kept for backward compatibility
  final String? src; // Generic source field (can be asset path or network URL)
  final ServerSvgType type;
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
      'src': src ?? assetName,
      'type': type.index,
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

        // Use src if available, otherwise fall back to assetName for backward compatibility
        final source = src ?? assetName ?? '';

        final placeholderWidget = Container(
          width: resolvedWidth,
          height: resolvedHeight,
          color: Colors.grey[200],
          child: Icon(Icons.image, color: Colors.grey[400], size: iconSize),
        );

        final errorWidget = Container(
          width: resolvedWidth,
          height: resolvedHeight,
          color: Colors.grey[300],
          child: Icon(
            Icons.broken_image,
            color: Colors.grey[600],
            size: iconSize,
          ),
        );

        try {
          switch (type) {
            case ServerSvgType.asset:
              return SvgPicture.asset(
                source,
                key: key,
                width: resolvedWidth,
                height: resolvedHeight,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
                fit: fit,
                alignment: alignment,
                placeholderBuilder: (context) => placeholderWidget,
              );
            case ServerSvgType.network:
              return SvgPicture.network(
                source,
                key: key,
                width: resolvedWidth,
                height: resolvedHeight,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
                fit: fit,
                alignment: alignment,
                placeholderBuilder: (context) => placeholderWidget,
              );
          }
        } catch (e, stackTrace) {
          debugPrint(
            'Error loading SVG ${type == ServerSvgType.asset ? 'asset' : 'network'}: $source',
          );
          debugPrint('Error: $e');
          debugPrint('Stack trace: $stackTrace');
          return errorWidget;
        }
      },
    );
  }
}
