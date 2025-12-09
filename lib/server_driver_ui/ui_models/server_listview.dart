import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/json_to_widget.dart';

class ServerListView {
  ServerListView({
    this.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.itemExtent,
    this.children,
    this.controller,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.widgetType = 'ServerListView',
  });

  factory ServerListView.fromJson(Map<String, dynamic> json) {
    return ServerListView(
      scrollDirection: json['scrollDirection'] != null
          ? Axis.values[json['scrollDirection']]
          : Axis.vertical,
      reverse: json['reverse'] ?? false,
      padding: json['padding'] != null
          ? parseEdgeInsets(json['padding'])
          : null,
      primary: json['primary'],
      physics: json['physics'] != null
          ? parseScrollPhysics(json['physics'])
          : null,
      shrinkWrap: json['shrinkWrap'] ?? false,
      itemExtent: (json['itemExtent'] as num?)?.toDouble(),
      children: json['children'] != null
          ? (json['children'] as List)
                .map(
                  (item) => ServerDrivenUI.parseWidgetFromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList()
          : null,
      controller: json['controller'] != null ? ScrollController() : null,
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.hardEdge,
      restorationId: json['restorationId'],
      keyboardDismissBehavior: json['keyboardDismissBehavior'] != null
          ? ScrollViewKeyboardDismissBehavior
                .values[json['keyboardDismissBehavior']]
          : ScrollViewKeyboardDismissBehavior.manual,
      addAutomaticKeepAlives: json['addAutomaticKeepAlives'] ?? true,
      addRepaintBoundaries: json['addRepaintBoundaries'] ?? true,
      addSemanticIndexes: json['addSemanticIndexes'] ?? true,
      cacheExtent: (json['cacheExtent'] as num?)?.toDouble(),
      widgetType: json['widgetType'] ?? 'ServerListView',
    );
  }
  Key? key;
  Axis scrollDirection;
  bool reverse;
  EdgeInsetsGeometry? padding;
  bool? primary;
  ScrollPhysics? physics;
  bool shrinkWrap;
  double? itemExtent;
  List<Widget>? children;
  ScrollController? controller;
  Clip clipBehavior;
  String? restorationId;
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  bool addAutomaticKeepAlives;
  bool addRepaintBoundaries;
  bool addSemanticIndexes;
  double? cacheExtent;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'scrollDirection': scrollDirection.index,
      'reverse': reverse,
      'padding': padding != null ? edgeInsetsToJson(padding!) : null,
      'primary': primary,
      'physics': physics != null ? serializeScrollPhysics(physics!) : null,
      'shrinkWrap': shrinkWrap,
      'itemExtent': itemExtent,
      'children': null,
      'controller': controller != null,
      'clipBehavior': clipBehavior.index,
      'restorationId': restorationId,
      'keyboardDismissBehavior': keyboardDismissBehavior.index,
      'addAutomaticKeepAlives': addAutomaticKeepAlives,
      'addRepaintBoundaries': addRepaintBoundaries,
      'addSemanticIndexes': addSemanticIndexes,
      'cacheExtent': cacheExtent,
    };
  }

  // Convert to Flutter ListView widget
  ListView toWidget() {
    return ListView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemExtent: itemExtent,
      controller: controller,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      children: children ?? [],
    );
  }
}

/// ScrollPhysics serialization (simplified)
ScrollPhysics parseScrollPhysics(Map<String, dynamic> json) {
  return const AlwaysScrollableScrollPhysics();
}

Map<String, dynamic> serializeScrollPhysics(ScrollPhysics physics) {
  return {'type': physics.runtimeType.toString()};
}

/// EdgeInsets helpers
EdgeInsets parseEdgeInsets(Map<String, dynamic> json) {
  return EdgeInsets.fromLTRB(
    (json['left'] as num?)?.toDouble() ?? 0,
    (json['top'] as num?)?.toDouble() ?? 0,
    (json['right'] as num?)?.toDouble() ?? 0,
    (json['bottom'] as num?)?.toDouble() ?? 0,
  );
}

Map<String, dynamic> edgeInsetsToJson(EdgeInsetsGeometry edgeInsets) {
  if (edgeInsets is EdgeInsets) {
    return {
      'left': edgeInsets.left,
      'top': edgeInsets.top,
      'right': edgeInsets.right,
      'bottom': edgeInsets.bottom,
    };
  }
  return {};
}
