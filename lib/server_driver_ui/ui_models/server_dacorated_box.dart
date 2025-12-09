import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';

class ServerDecoratedBox {
  ServerDecoratedBox({
    this.key,
    required this.decoration,
    this.child,
    this.widgetType = 'ServerDecoratedBox',
  });

  factory ServerDecoratedBox.fromJson(Map<String, dynamic> json) {
    final dec = json['decoration'];
    return ServerDecoratedBox(
      key: json['key'] != null ? Key(json['key']) : null,
      decoration: BoxDecoration(
        color: colorFromHex(dec['color']),
        gradient: dec['gradient'] != null
            ? LinearGradient(
                colors: (dec['gradient']['colors'] as List)
                    .map((c) => colorFromHex(c) ?? Colors.transparent)
                    .toList(),
                begin: Alignment(
                  (dec['gradient']['begin']['x'] as num?)?.toDouble() ?? 0,
                  (dec['gradient']['begin']['y'] as num?)?.toDouble() ?? 0,
                ),
                end: Alignment(
                  (dec['gradient']['end']['x'] as num?)?.toDouble() ?? 0,
                  (dec['gradient']['end']['y'] as num?)?.toDouble() ?? 0,
                ),
                stops: dec['gradient']['stops'] != null
                    ? (dec['gradient']['stops'] as List)
                          .map((s) => (s as num).toDouble())
                          .toList()
                    : null,
              )
            : null,
        borderRadius: dec['borderRadius'] != null
            ? BorderRadius.circular(
                (dec['borderRadius']['radius'] as num?)?.toDouble() ?? 0,
              )
            : null,
      ),
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerDecoratedBox',
    );
  }
  final Key? key;
  final Decoration decoration;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    final box = decoration as BoxDecoration;
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'decoration': {
        'color': colorToHex(box.color),
        'gradient': box.gradient != null
            ? {
                'colors': (box.gradient! as LinearGradient).colors
                    .map((e) => colorToHex(e))
                    .toList(),
                'begin': (box.gradient! as LinearGradient).begin is Alignment
                    ? {
                        'x':
                            ((box.gradient! as LinearGradient).begin
                                    as Alignment)
                                .x,
                        'y':
                            ((box.gradient! as LinearGradient).begin
                                    as Alignment)
                                .y,
                      }
                    : {'x': 0.0, 'y': 0.0},
                'end': (box.gradient! as LinearGradient).end is Alignment
                    ? {
                        'x':
                            ((box.gradient! as LinearGradient).end as Alignment)
                                .x,
                        'y':
                            ((box.gradient! as LinearGradient).end as Alignment)
                                .y,
                      }
                    : {'x': 0.0, 'y': 0.0},
                'stops': (box.gradient! as LinearGradient).stops,
              }
            : null,
        'borderRadius': box.borderRadius != null
            ? {'radius': (box.borderRadius! as BorderRadius).topLeft.x}
            : null,
      },
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return DecoratedBox(key: key, decoration: decoration, child: childWidget);
  }
}
