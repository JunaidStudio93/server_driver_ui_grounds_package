import 'package:flutter/material.dart';

class ServerListViewBuilder {
  ServerListViewBuilder({
    this.key,
    required this.itemCount,
    required this.itemBuilderData,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary = false,
    this.physics,
    this.shrinkWrap = false,
    this.itemExtent,
    this.widgetType = 'ServerListViewBuilder',
  });

  factory ServerListViewBuilder.fromJson(Map<String, dynamic> json) {
    return ServerListViewBuilder(
      key: json['key'] != null ? Key(json['key']) : null,
      itemCount: json['itemCount'] ?? 0,
      itemBuilderData: json['itemBuilderData'] ?? [],
      scrollDirection: json['scrollDirection'] != null
          ? Axis.values[json['scrollDirection']]
          : Axis.vertical,
      reverse: json['reverse'] ?? false,
      padding: json['padding'] != null
          ? EdgeInsets.fromLTRB(
              (json['padding']['left'] as num?)?.toDouble() ?? 0,
              (json['padding']['top'] as num?)?.toDouble() ?? 0,
              (json['padding']['right'] as num?)?.toDouble() ?? 0,
              (json['padding']['bottom'] as num?)?.toDouble() ?? 0,
            )
          : null,
      primary: json['primary'] ?? false,
      shrinkWrap: json['shrinkWrap'] ?? false,
      itemExtent: (json['itemExtent'] as num?)?.toDouble(),
      widgetType: json['widgetType'] ?? 'ServerListViewBuilder',
    );
  }
  final Axis scrollDirection;
  final bool reverse;
  final EdgeInsetsGeometry? padding;
  final bool primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final double? itemExtent;
  final int itemCount;
  final List<Map<String, dynamic>> itemBuilderData;
  final Key? key;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'itemCount': itemCount,
      'itemBuilderData': itemBuilderData,
      'scrollDirection': scrollDirection.index,
      'reverse': reverse,
      'padding': padding != null
          ? {
              'left': (padding! as EdgeInsets).left,
              'top': (padding! as EdgeInsets).top,
              'right': (padding! as EdgeInsets).right,
              'bottom': (padding! as EdgeInsets).bottom,
            }
          : null,
      'primary': primary,
      'shrinkWrap': shrinkWrap,
      'itemExtent': itemExtent,
    };
  }

  // Convert to actual Flutter ListView.builder
  ListView toWidget({
    required Widget Function(int index, Map<String, dynamic> data) itemBuilder,
  }) {
    return ListView.builder(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      shrinkWrap: shrinkWrap,
      itemExtent: itemExtent,
      itemCount: itemCount,
      itemBuilder: (context, index) =>
          itemBuilder(index, itemBuilderData[index]),
    );
  }
}
