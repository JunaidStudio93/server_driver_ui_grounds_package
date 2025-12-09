import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_helper.dart';

enum ServerImageType { asset, network, file, memory }

class ServerImage {
  ServerImage({
    this.key,
    required this.type,
    this.src,
    this.bytes,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.low,
    this.color,
    this.colorBlendMode,
    this.excludeFromSemantics = false,
    this.semanticLabel,
    this.widgetType = 'ServerImage',
  });

  factory ServerImage.fromJson(Map<String, dynamic> json) {
    return ServerImage(
      key: json['key'] != null ? Key(json['key']) : null,
      type: ServerImageType.values[json['type']],
      src: json['src'],
      bytes: json['bytes'] != null ? base64Decode(json['bytes']) : null,
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      fit: json['fit'] != null ? BoxFit.values[json['fit']] : null,
      alignment: json['alignment'] != null
          ? Alignment(
              json['alignment']['x']?.toDouble() ?? 0.0,
              json['alignment']['y']?.toDouble() ?? 0.0,
            )
          : Alignment.center,
      repeat: json['repeat'] != null
          ? ImageRepeat.values[json['repeat']]
          : ImageRepeat.noRepeat,
      matchTextDirection: json['matchTextDirection'] ?? false,
      gaplessPlayback: json['gaplessPlayback'] ?? false,
      filterQuality: json['filterQuality'] != null
          ? FilterQuality.values[json['filterQuality']]
          : FilterQuality.low,
      color: json['color'] != null ? Color(json['color']) : null,
      colorBlendMode: json['colorBlendMode'] != null
          ? BlendMode.values[json['colorBlendMode']]
          : null,
      excludeFromSemantics: json['excludeFromSemantics'] ?? false,
      semanticLabel: json['semanticLabel'],
      widgetType: json['widgetType'] ?? 'ServerImage',
    );
  }
  Key? key;
  ServerImageType type;
  String? src;
  Uint8List? bytes;
  SizeValue? width;
  SizeValue? height;
  BoxFit? fit;
  AlignmentGeometry alignment;
  ImageRepeat repeat;
  bool matchTextDirection;
  bool gaplessPlayback;
  FilterQuality filterQuality;
  Color? color;
  BlendMode? colorBlendMode;
  bool excludeFromSemantics;
  String? semanticLabel;
  final String widgetType;

  Map<String, dynamic> toJson() {
    Alignment alignmentValue;
    if (alignment is Alignment) {
      alignmentValue = alignment as Alignment;
    } else {
      alignmentValue = Alignment.center;
    }

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'type': type.index,
      'src': src,
      'bytes': bytes != null ? base64Encode(bytes!) : null,
      'width': width?.toJson(),
      'height': height?.toJson(),
      'fit': fit?.index,
      'alignment': {'x': alignmentValue.x, 'y': alignmentValue.y},
      'repeat': repeat.index,
      'matchTextDirection': matchTextDirection,
      'gaplessPlayback': gaplessPlayback,
      'filterQuality': filterQuality.index,
      'color': color?.value,
      'colorBlendMode': colorBlendMode?.index,
      'excludeFromSemantics': excludeFromSemantics,
      'semanticLabel': semanticLabel,
    };
  }

  Widget toWidget() {
    return Builder(
      builder: (context) {
        final resolvedWidth = width?.resolve(context);
        final resolvedHeight = height?.resolveHeight(context);
        switch (type) {
          case ServerImageType.asset:
            return Image.asset(
              src ?? '',
              key: key,
              width: resolvedWidth,
              height: resolvedHeight,
              fit: fit,
              alignment: alignment,
              repeat: repeat,
              matchTextDirection: matchTextDirection,
              gaplessPlayback: gaplessPlayback,
              filterQuality: filterQuality,
              color: color,
              colorBlendMode: colorBlendMode,
              excludeFromSemantics: excludeFromSemantics,
              semanticLabel: semanticLabel,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Error loading image asset: ${src ?? ''}');
                debugPrint('Error: $error');
                double iconSize = 24.0;
                if (resolvedWidth != null && resolvedHeight != null) {
                  iconSize = resolvedWidth < resolvedHeight
                      ? resolvedWidth
                      : resolvedHeight;
                }
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
              },
            );
          case ServerImageType.network:
            return Image(
              key: key,
              image: NetworkImage(src ?? ''),
              width: resolvedWidth,
              height: resolvedHeight,
              fit: fit,
              alignment: alignment,
              repeat: repeat,
              matchTextDirection: matchTextDirection,
              gaplessPlayback: gaplessPlayback,
              filterQuality: filterQuality,
              color: color,
              colorBlendMode: colorBlendMode,
              excludeFromSemantics: excludeFromSemantics,
              semanticLabel: semanticLabel,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Error loading network image: ${src ?? ''}');
                debugPrint('Error: $error');
                double iconSize = 24.0;
                if (resolvedWidth != null && resolvedHeight != null) {
                  iconSize = resolvedWidth < resolvedHeight
                      ? resolvedWidth
                      : resolvedHeight;
                }
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
              },
            );
          case ServerImageType.file:
            return Image(
              key: key,
              image: FileImage(File(src ?? '')),
              width: resolvedWidth,
              height: resolvedHeight,
              fit: fit,
              alignment: alignment,
              repeat: repeat,
              matchTextDirection: matchTextDirection,
              gaplessPlayback: gaplessPlayback,
              filterQuality: filterQuality,
              color: color,
              colorBlendMode: colorBlendMode,
              excludeFromSemantics: excludeFromSemantics,
              semanticLabel: semanticLabel,
            );
          case ServerImageType.memory:
            return Image(
              key: key,
              image: MemoryImage(bytes ?? Uint8List(0)),
              width: resolvedWidth,
              height: resolvedHeight,
              fit: fit,
              alignment: alignment,
              repeat: repeat,
              matchTextDirection: matchTextDirection,
              gaplessPlayback: gaplessPlayback,
              filterQuality: filterQuality,
              color: color,
              colorBlendMode: colorBlendMode,
              excludeFromSemantics: excludeFromSemantics,
              semanticLabel: semanticLabel,
            );
        }
      },
    );
  }
}
