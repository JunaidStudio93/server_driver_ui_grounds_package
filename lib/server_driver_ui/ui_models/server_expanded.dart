import 'package:flutter/material.dart';

class ServerExpanded {
  ServerExpanded({
    this.key,
    this.flex = 1,
    this.child,
    this.widgetType = 'ServerExpanded',
  });

  factory ServerExpanded.fromJson(Map<String, dynamic> json) {
    return ServerExpanded(
      key: json['key'] != null ? Key(json['key']) : null,
      flex: json['flex'] ?? 1,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerExpanded',
    );
  }

  final Key? key;
  final int flex;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'flex': flex,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Expanded(
      key: key,
      flex: flex,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

class ServerFlexible {
  ServerFlexible({
    this.key,
    this.flex = 1,
    this.fit = FlexFit.loose,
    this.child,
    this.widgetType = 'ServerFlexible',
  });

  factory ServerFlexible.fromJson(Map<String, dynamic> json) {
    return ServerFlexible(
      key: json['key'] != null ? Key(json['key']) : null,
      flex: json['flex'] ?? 1,
      fit: json['fit'] != null
          ? FlexFit.values[json['fit']]
          : FlexFit.loose,
      child: json['child'],
      widgetType: json['widgetType'] ?? 'ServerFlexible',
    );
  }

  final Key? key;
  final int flex;
  final FlexFit fit;
  final Map<String, dynamic>? child;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'flex': flex,
      'fit': fit.index,
      'child': child,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return Flexible(
      key: key,
      flex: flex,
      fit: fit,
      child: childWidget ?? const SizedBox.shrink(),
    );
  }
}

