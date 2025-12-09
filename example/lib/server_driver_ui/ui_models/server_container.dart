import 'package:flutter/material.dart';
import 'package:example/server_driver_ui/ui_models/server_helper.dart';

class ServerContainer {
  ServerContainer({
    this.key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.widgetType = 'ServerContainer',
  });

  factory ServerContainer.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    final alignmentJson = json['alignment'];
    final paddingJson = json['padding'];
    final marginJson = json['margin'];
    final constraintsJson = json['constraints'];
    final transformJson = json['transform'];
    final transformAlignmentJson = json['transformAlignment'];

    return ServerContainer(
      key: json['key'] != null ? Key(json['key']) : null,
      alignment: alignmentJson != null
          ? Alignment(
              (alignmentJson['x'] as num?)?.toDouble() ?? 0.0,
              (alignmentJson['y'] as num?)?.toDouble() ?? 0.0,
            )
          : null,
      padding: paddingJson != null
          ? EdgeInsets.fromLTRB(
              (paddingJson['left'] as num?)?.toDouble() ?? 0,
              (paddingJson['top'] as num?)?.toDouble() ?? 0,
              (paddingJson['right'] as num?)?.toDouble() ?? 0,
              (paddingJson['bottom'] as num?)?.toDouble() ?? 0,
            )
          : null,
      color: colorFromHex(
        json['color'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      decoration: json['decoration'] != null
          ? ServerBoxDecoration.fromJson(
              json['decoration'],
              brightness: brightness,
              valueResolver: valueResolver,
            ).toBoxDecoration()
          : null,
      foregroundDecoration: json['foregroundDecoration'] != null
          ? ServerBoxDecoration.fromJson(
              json['foregroundDecoration'],
              brightness: brightness,
              valueResolver: valueResolver,
            ).toBoxDecoration()
          : null,
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      constraints: constraintsJson != null
          ? BoxConstraints(
              minWidth: (constraintsJson['minWidth'] as num?)?.toDouble() ?? 0,
              maxWidth:
                  (constraintsJson['maxWidth'] as num?)?.toDouble() ??
                  double.infinity,
              minHeight:
                  (constraintsJson['minHeight'] as num?)?.toDouble() ?? 0,
              maxHeight:
                  (constraintsJson['maxHeight'] as num?)?.toDouble() ??
                  double.infinity,
            )
          : null,
      margin: marginJson != null
          ? EdgeInsets.fromLTRB(
              (marginJson['left'] as num?)?.toDouble() ?? 0,
              (marginJson['top'] as num?)?.toDouble() ?? 0,
              (marginJson['right'] as num?)?.toDouble() ?? 0,
              (marginJson['bottom'] as num?)?.toDouble() ?? 0,
            )
          : null,
      transform: transformJson != null
          ? Matrix4(
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
            )
          : null,
      transformAlignment: transformAlignmentJson != null
          ? Alignment(
              (transformAlignmentJson['x'] as num?)?.toDouble() ?? 0.0,
              (transformAlignmentJson['y'] as num?)?.toDouble() ?? 0.0,
            )
          : null,
      child: json['child'],
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.none,
      widgetType: json['widgetType'] ?? 'ServerContainer',
    );
  }

  final Key? key;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final SizeValue? width;
  final SizeValue? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Map<String, dynamic>? child;
  final Clip clipBehavior;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final alignmentValue = alignment is Alignment
        ? {'x': (alignment as Alignment).x, 'y': (alignment as Alignment).y}
        : null;

    final paddingValue = padding != null
        ? () {
            final resolved = padding! is EdgeInsets
                ? padding! as EdgeInsets
                : padding!.resolve(TextDirection.ltr);
            return {
              'left': resolved.left,
              'top': resolved.top,
              'right': resolved.right,
              'bottom': resolved.bottom,
            };
          }()
        : null;

    final marginValue = margin != null
        ? () {
            final resolved = margin! is EdgeInsets
                ? margin! as EdgeInsets
                : margin!.resolve(TextDirection.ltr);
            return {
              'left': resolved.left,
              'top': resolved.top,
              'right': resolved.right,
              'bottom': resolved.bottom,
            };
          }()
        : null;

    final constraintsValue = constraints != null
        ? {
            'minWidth': constraints!.minWidth,
            'maxWidth': constraints!.maxWidth == double.infinity
                ? null
                : constraints!.maxWidth,
            'minHeight': constraints!.minHeight,
            'maxHeight': constraints!.maxHeight == double.infinity
                ? null
                : constraints!.maxHeight,
          }
        : null;

    final transformValue = transform != null
        ? [
            transform!.entry(0, 0),
            transform!.entry(1, 0),
            transform!.entry(2, 0),
            transform!.entry(3, 0),
            transform!.entry(0, 1),
            transform!.entry(1, 1),
            transform!.entry(2, 1),
            transform!.entry(3, 1),
            transform!.entry(0, 2),
            transform!.entry(1, 2),
            transform!.entry(2, 2),
            transform!.entry(3, 2),
            transform!.entry(0, 3),
            transform!.entry(1, 3),
            transform!.entry(2, 3),
            transform!.entry(3, 3),
          ]
        : null;

    final transformAlignmentValue = transformAlignment is Alignment
        ? {
            'x': (transformAlignment as Alignment).x,
            'y': (transformAlignment as Alignment).y,
          }
        : null;

    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'alignment': alignmentValue,
      'padding': paddingValue,
      'color': colorToHex(color),
      'decoration': decoration != null
          ? ServerBoxDecoration.fromBoxDecoration(
              decoration as BoxDecoration,
            ).toJson()
          : null,
      'foregroundDecoration': foregroundDecoration != null
          ? ServerBoxDecoration.fromBoxDecoration(
              foregroundDecoration as BoxDecoration,
            ).toJson()
          : null,
      'width': width?.toJson(),
      'height': height?.toJson(),
      'constraints': constraintsValue,
      'margin': marginValue,
      'transform': transformValue,
      'transformAlignment': transformAlignmentValue,
      'child': child,
      'clipBehavior': clipBehavior.index,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Builder(
      builder: (context) {
        final resolvedWidth = width?.resolve(context);
        final resolvedHeight = height?.resolveHeight(context);
        return Container(
          key: key,
          alignment: alignment,
          padding: padding,
          color: color,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          width: resolvedWidth,
          height: resolvedHeight,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          child: childWidget,
        );
      },
    );
  }
}

class ServerBoxDecoration {
  ServerBoxDecoration({
    this.color,
    this.image,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.gradient,
    this.backgroundBlendMode,
    this.shape = BoxShape.rectangle,
  });

  factory ServerBoxDecoration.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    return ServerBoxDecoration(
      color: colorFromHex(
        json['color'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      image: json['image'] != null
          ? DecorationImage(
              image: NetworkImage(json['image']['url']),
              fit: json['image']['fit'] != null
                  ? BoxFit.values[json['image']['fit']]
                  : BoxFit.cover,
            )
          : null,
      border: json['border'] != null
          ? Border.all(
              color:
                  colorFromHex(
                    json['border']['color'],
                    brightness: brightness,
                    valueResolver: valueResolver,
                  ) ??
                  Colors.black,
              width: (json['border']['width'] as num?)?.toDouble() ?? 1.0,
            )
          : null,
      borderRadius: json['borderRadius'] != null
          ? BorderRadius.circular(
              (json['borderRadius']['radius'] as num?)?.toDouble() ?? 0,
            )
          : null,
      boxShadow: json['boxShadow'] != null
          ? (json['boxShadow'] as List)
                .map(
                  (s) => BoxShadow(
                    color:
                        colorFromHex(
                          s['color'],
                          brightness: brightness,
                          valueResolver: valueResolver,
                        ) ??
                        Colors.black,
                    offset: Offset(
                      (s['offset']['dx'] as num?)?.toDouble() ?? 0,
                      (s['offset']['dy'] as num?)?.toDouble() ?? 0,
                    ),
                    blurRadius: (s['blurRadius'] as num?)?.toDouble() ?? 0,
                    spreadRadius: (s['spreadRadius'] as num?)?.toDouble() ?? 0,
                  ),
                )
                .toList()
          : null,
      gradient: json['gradient'] != null
          ? LinearGradient(
              colors: (json['gradient']['colors'] as List)
                  .map(
                    (c) =>
                        colorFromHex(
                          c,
                          brightness: brightness,
                          valueResolver: valueResolver,
                        ) ??
                        Colors.transparent,
                  )
                  .toList(),
              begin: Alignment(
                (json['gradient']['begin']['x'] as num?)?.toDouble() ?? 0,
                (json['gradient']['begin']['y'] as num?)?.toDouble() ?? 0,
              ),
              end: Alignment(
                (json['gradient']['end']['x'] as num?)?.toDouble() ?? 0,
                (json['gradient']['end']['y'] as num?)?.toDouble() ?? 0,
              ),
            )
          : null,
      backgroundBlendMode: json['backgroundBlendMode'] != null
          ? BlendMode.values[json['backgroundBlendMode']]
          : null,
      shape: json['shape'] != null
          ? BoxShape.values[json['shape']]
          : BoxShape.rectangle,
    );
  }

  factory ServerBoxDecoration.fromBoxDecoration(BoxDecoration decoration) {
    return ServerBoxDecoration(
      color: decoration.color,
      image: decoration.image,
      border: decoration.border is Border ? decoration.border as Border : null,
      borderRadius: decoration.borderRadius,
      boxShadow: decoration.boxShadow,
      gradient: decoration.gradient as LinearGradient?,
      backgroundBlendMode: decoration.backgroundBlendMode,
      shape: decoration.shape,
    );
  }

  final Color? color;
  final DecorationImage? image;
  final Border? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape shape;

  Map<String, dynamic> toJson() {
    return {
      'color': colorToHex(color),
      'image': image != null
          ? {
              'url': (image!.image as NetworkImage).url,
              'fit': image!.fit?.index,
            }
          : null,
      'border': border != null
          ? {'color': colorToHex(border!.top.color), 'width': border!.top.width}
          : null,
      'borderRadius': borderRadius != null
          ? {'radius': (borderRadius as BorderRadius).topLeft.x}
          : null,
      'boxShadow': boxShadow?.map(
        (s) => {
          'color': colorToHex(s.color),
          'offset': {'dx': s.offset.dx, 'dy': s.offset.dy},
          'blurRadius': s.blurRadius,
          'spreadRadius': s.spreadRadius,
        },
      ),
      'gradient': gradient != null && gradient is LinearGradient
          ? {
              'colors': (gradient as LinearGradient).colors
                  .map((c) => colorToHex(c))
                  .toList(),
              'begin': {
                'x': (gradient as LinearGradient).begin is Alignment
                    ? ((gradient as LinearGradient).begin as Alignment).x
                    : 0.0,
                'y': (gradient as LinearGradient).begin is Alignment
                    ? ((gradient as LinearGradient).begin as Alignment).y
                    : 0.0,
              },
              'end': {
                'x': (gradient as LinearGradient).end is Alignment
                    ? ((gradient as LinearGradient).end as Alignment).x
                    : 0.0,
                'y': (gradient as LinearGradient).end is Alignment
                    ? ((gradient as LinearGradient).end as Alignment).y
                    : 0.0,
              },
            }
          : null,
      'backgroundBlendMode': backgroundBlendMode?.index,
      'shape': shape.index,
    };
  }

  BoxDecoration toBoxDecoration() {
    return BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
  }
}
