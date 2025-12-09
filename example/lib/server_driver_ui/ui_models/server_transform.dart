import 'package:flutter/material.dart';

class ServerTransform {
  ServerTransform({
    this.key,
    required this.transform,
    this.origin,
    this.alignment,
    this.transformHitTests = true,
    this.filterQuality = FilterQuality.low,
    this.child,
    this.widgetType = 'ServerTransform',
  });

  factory ServerTransform.fromJson(Map<String, dynamic> json) {
    final transformJson = json['transform'];
    final originJson = json['origin'];
    final alignmentJson = json['alignment'];

    Matrix4? transformMatrix;
    if (transformJson != null) {
      transformMatrix = Matrix4(
        transformJson[0] ?? 1.0,
        transformJson[1] ?? 0.0,
        transformJson[2] ?? 0.0,
        transformJson[3] ?? 0.0,
        transformJson[4] ?? 0.0,
        transformJson[5] ?? 1.0,
        transformJson[6] ?? 0.0,
        transformJson[7] ?? 0.0,
        transformJson[8] ?? 0.0,
        transformJson[9] ?? 0.0,
        transformJson[10] ?? 1.0,
        transformJson[11] ?? 0.0,
        transformJson[12] ?? 0.0,
        transformJson[13] ?? 0.0,
        transformJson[14] ?? 0.0,
        transformJson[15] ?? 1.0,
      );
    }

    return ServerTransform(
      key: json['key'] != null ? Key(json['key']) : null,
      transform: transformMatrix ?? Matrix4.identity(),
      origin: originJson != null
          ? Offset(
              (originJson['dx'] as num?)?.toDouble() ?? 0,
              (originJson['dy'] as num?)?.toDouble() ?? 0,
            )
          : null,
      alignment: alignmentJson != null
          ? Alignment(
              (alignmentJson['x'] as num?)?.toDouble() ?? 0.0,
              (alignmentJson['y'] as num?)?.toDouble() ?? 0.0,
            )
          : null,
      transformHitTests: json['transformHitTests'] ?? true,
      filterQuality: json['filterQuality'] != null
          ? FilterQuality.values[json['filterQuality']]
          : FilterQuality.low,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerTransform',
    );
  }

  final Key? key;
  final Matrix4 transform;
  final Offset? origin;
  final AlignmentGeometry? alignment;
  final bool transformHitTests;
  final FilterQuality filterQuality;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final transformValue = [
      transform.entry(0, 0),
      transform.entry(1, 0),
      transform.entry(2, 0),
      transform.entry(3, 0),
      transform.entry(0, 1),
      transform.entry(1, 1),
      transform.entry(2, 1),
      transform.entry(3, 1),
      transform.entry(0, 2),
      transform.entry(1, 2),
      transform.entry(2, 2),
      transform.entry(3, 2),
      transform.entry(0, 3),
      transform.entry(1, 3),
      transform.entry(2, 3),
      transform.entry(3, 3),
    ];

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'transform': transformValue,
      'origin': origin != null ? {'dx': origin!.dx, 'dy': origin!.dy} : null,
      'alignment': alignment is Alignment
          ? {
              'x': (alignment as Alignment).x,
              'y': (alignment as Alignment).y,
            }
          : null,
      'transformHitTests': transformHitTests,
      'filterQuality': filterQuality.index,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Transform(
      key: key,
      transform: transform,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

