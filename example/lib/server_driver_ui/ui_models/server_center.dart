import 'package:flutter/material.dart';

class ServerCenter {
  ServerCenter({
    this.key,
    this.child,
    this.widthFactor,
    this.heightFactor,
    this.widgetType = 'ServerCenter',
  });

  factory ServerCenter.fromJson(Map<String, dynamic> json) {
    return ServerCenter(
      key: json['key'] != null ? Key(json['key']) : null,
      child: json['child'],
      widthFactor: (json['widthFactor'] as num?)?.toDouble(),
      heightFactor: (json['heightFactor'] as num?)?.toDouble(),
      widgetType: json['widgetType'] ?? 'ServerCenter',
    );
  }

  final Key? key;
  final Map<String, dynamic>? child;
  final double? widthFactor;
  final double? heightFactor;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'child': child,
      'widthFactor': widthFactor,
      'heightFactor': heightFactor,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Center(
      key: key,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: childWidget,
    );
  }
}

