import 'package:flutter/material.dart';

class ServerClipPath {
  ServerClipPath({
    required this.clipper,
    this.key,
    this.clipBehavior = Clip.antiAlias,
    this.child,
    this.widgetType = 'ServerClipPath',
  });

  factory ServerClipPath.fromJson(Map<String, dynamic> json) {
    return ServerClipPath(
      clipper: json['clipper'] != null
          ? ServerCustomClipper.fromJson(json['clipper']).toCustomClipper()
          : null,
      key: json['key'] != null ? Key(json['key']) : null,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.antiAlias,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerClipPath',
    );
  }

  final CustomClipper<Path>? clipper;
  final Key? key;
  final Clip clipBehavior;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'clipper': clipper != null
          ? ServerCustomClipper.fromCustomClipper(clipper!).toJson()
          : null,
      'key': key?.toString(),
      'clipBehavior': clipBehavior.index,
      'child': child,
    };
  }

  ClipPath toWidget({Widget? childWidget}) {
    if (clipper == null) {
      return ClipPath(
        key: key,
        clipBehavior: clipBehavior,
        child: childWidget,
      );
    }
    return ClipPath(
      key: key,
      clipper: clipper!,
      clipBehavior: clipBehavior,
      child: childWidget,
    );
  }
}

class ServerCustomClipper {
  ServerCustomClipper({
    required this.type,
    this.notchSize,
    this.widgetType = 'ServerCustomClipper',
  });

  factory ServerCustomClipper.fromJson(Map<String, dynamic> json) {
    return ServerCustomClipper(
      type: json['type'] ?? 'diagonalNotch',
      notchSize: (json['notchSize'] as num?)?.toDouble(),
      widgetType: json['widgetType'] ?? 'ServerCustomClipper',
    );
  }

  factory ServerCustomClipper.fromCustomClipper(CustomClipper<Path> clipper) {
    if (clipper is DiagonalNotchClipper) {
      return ServerCustomClipper(
        type: 'diagonalNotch',
        notchSize: clipper.notchSize,
      );
    }
    return ServerCustomClipper(type: 'unknown');
  }

  final String type;
  final double? notchSize;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'type': type,
      'notchSize': notchSize,
    };
  }

  CustomClipper<Path> toCustomClipper() {
    switch (type) {
      case 'diagonalNotch':
        return DiagonalNotchClipper(notchSize: notchSize ?? 20.0);
      default:
        return _DefaultClipper();
    }
  }
}

class DiagonalNotchClipper extends CustomClipper<Path> {
  DiagonalNotchClipper({this.notchSize = 20.0});

  final double notchSize;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(notchSize, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, notchSize)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _DefaultClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

