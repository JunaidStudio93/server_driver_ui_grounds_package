import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_text.dart';

class ServerSingleChildScrollView {
  ServerSingleChildScrollView({
    this.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.clipBehavior = Clip.hardEdge,
    this.child,
    this.restorationId,
    this.dragStartBehavior = DragStartBehavior.start,
    this.controller,
    this.widgetType = 'ServerSingleChildScrollView',
  });

  factory ServerSingleChildScrollView.fromJson(Map<String, dynamic> json) {
    return ServerSingleChildScrollView(
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
      clipBehavior: json['clipBehavior'] != null
          ? Clip.values[json['clipBehavior']]
          : Clip.hardEdge,
      child: json['child'],
      restorationId: json['restorationId'],
      dragStartBehavior: json['dragStartBehavior'] != null
          ? DragStartBehavior.values[json['dragStartBehavior']]
          : DragStartBehavior.start,
      controller: json['controller'] != null ? ScrollController() : null,
      widgetType: json['widgetType'] ?? 'ServerSingleChildScrollView',
    );
  }
  Key? key;
  Axis scrollDirection;
  bool reverse;
  EdgeInsetsGeometry? padding;
  bool? primary;
  ScrollPhysics? physics;
  Clip clipBehavior;
  Map<String, dynamic>? child;
  String? restorationId;
  DragStartBehavior dragStartBehavior;
  ScrollController? controller;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'scrollDirection': scrollDirection.index,
      'reverse': reverse,
      'padding': padding != null ? edgeInsetsToJson(padding!) : null,
      'primary': primary,
      'physics': physics != null ? serializeScrollPhysics(physics!) : null,
      'clipBehavior': clipBehavior.index,
      'child': child,
      'restorationId': restorationId,
      'dragStartBehavior': dragStartBehavior.index,
      'controller': controller != null,
    };
  }

  SingleChildScrollView toWidget({Widget? childWidget}) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      dragStartBehavior: dragStartBehavior,
      controller: controller,
      child: childWidget,
    );
  }
}

Map<String, dynamic> widgetToJson(Widget widget) {
  if (widget is Text) {
    final textSpan = widget.textSpan;
    final textData = textSpan != null ? textSpan.toPlainText() : '';
    return ServerText(data: textData).toJson();
  } else if (widget is SingleChildScrollView) {
    return {
      'type': 'ServerSingleChildScrollView',
      'child': widget.child != null ? widgetToJson(widget.child!) : null,
    };
  }
  return {'type': 'Unknown'};
}

/// ScrollPhysics serialization (simplified)
ScrollPhysics parseScrollPhysics(Map<String, dynamic> json) {
  // Add more types if needed
  return const AlwaysScrollableScrollPhysics();
}

Map<String, dynamic> serializeScrollPhysics(ScrollPhysics physics) {
  // Add more types if needed
  return {'type': physics.runtimeType.toString()};
}

/// Reuse EdgeInsets helpers
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
