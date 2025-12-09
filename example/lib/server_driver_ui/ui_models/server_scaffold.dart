import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:example/server_driver_ui/ui_models/server_helper.dart';
import 'package:example/server_driver_ui/widget_to_json.dart';

Map<String, dynamic> widgetToJson(Widget widget) {
  return WidgetToJson.convert(widget);
}

FloatingActionButtonLocation? _parseFloatingActionButtonLocation(
  Object? value,
) {
  if (value == null) return null;
  if (value is String) {
    switch (value) {
      case 'endFloat':
        return FloatingActionButtonLocation.endFloat;
      case 'centerFloat':
        return FloatingActionButtonLocation.centerFloat;
      case 'endDocked':
        return FloatingActionButtonLocation.endDocked;
      case 'centerDocked':
        return FloatingActionButtonLocation.centerDocked;
      case 'miniStartTop':
        return FloatingActionButtonLocation.miniStartTop;
      case 'miniStartFloat':
        return FloatingActionButtonLocation.miniStartFloat;
      case 'miniCenterTop':
        return FloatingActionButtonLocation.miniCenterTop;
      case 'miniCenterFloat':
        return FloatingActionButtonLocation.miniCenterFloat;
      case 'miniEndTop':
        return FloatingActionButtonLocation.miniEndTop;
      case 'miniEndFloat':
        return FloatingActionButtonLocation.miniEndFloat;
      default:
        return FloatingActionButtonLocation.endFloat;
    }
  }
  return FloatingActionButtonLocation.endFloat;
}

String? _floatingActionButtonLocationToJson(
  FloatingActionButtonLocation? location,
) {
  if (location == null) return null;
  if (location == FloatingActionButtonLocation.endFloat) return 'endFloat';
  if (location == FloatingActionButtonLocation.centerFloat)
    return 'centerFloat';
  if (location == FloatingActionButtonLocation.endDocked) return 'endDocked';
  if (location == FloatingActionButtonLocation.centerDocked)
    return 'centerDocked';
  if (location == FloatingActionButtonLocation.miniStartTop)
    return 'miniStartTop';
  if (location == FloatingActionButtonLocation.miniStartFloat)
    return 'miniStartFloat';
  if (location == FloatingActionButtonLocation.miniCenterTop)
    return 'miniCenterTop';
  if (location == FloatingActionButtonLocation.miniCenterFloat)
    return 'miniCenterFloat';
  if (location == FloatingActionButtonLocation.miniEndTop) return 'miniEndTop';
  if (location == FloatingActionButtonLocation.miniEndFloat)
    return 'miniEndFloat';
  return 'endFloat';
}

FloatingActionButtonAnimator? _parseFloatingActionButtonAnimator(
  Object? value,
) {
  if (value == null) return null;
  if (value is String) {
    switch (value) {
      case 'scaling':
        return FloatingActionButtonAnimator.scaling;
      default:
        return FloatingActionButtonAnimator.scaling;
    }
  }
  return FloatingActionButtonAnimator.scaling;
}

String? _floatingActionButtonAnimatorToJson(
  FloatingActionButtonAnimator? animator,
) {
  if (animator == null) return null;
  if (animator == FloatingActionButtonAnimator.scaling) return 'scaling';
  return 'scaling';
}

class ServerScaffold {
  ServerScaffold({
    this.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary,
    this.extendBody,
    this.extendBodyBehindAppBar,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture,
    this.endDrawerEnableOpenDragGesture,
    this.drawerDragStartBehavior,
    this.restorationId,
    this.widgetType = 'ServerScaffold',
  });

  factory ServerScaffold.fromJson(
    Map<String, dynamic> json, {
    Brightness? brightness,
    dynamic Function(String)? valueResolver,
  }) {
    return ServerScaffold(
      key: json['key'] != null ? Key(json['key']) : null,
      appBar: json['appBar'],
      body: json['body'],
      floatingActionButton: json['floatingActionButton'],
      floatingActionButtonLocation: _parseFloatingActionButtonLocation(
        json['floatingActionButtonLocation'],
      ),
      floatingActionButtonAnimator: _parseFloatingActionButtonAnimator(
        json['floatingActionButtonAnimator'],
      ),
      persistentFooterButtons: json['persistentFooterButtons'],
      drawer: json['drawer'],
      onDrawerChanged: json['onDrawerChanged'] != null ? (isOpen) {} : null,
      endDrawer: json['endDrawer'],
      onEndDrawerChanged: json['onEndDrawerChanged'] != null
          ? (isOpen) {}
          : null,
      bottomNavigationBar: json['bottomNavigationBar'],
      backgroundColor: colorFromHex(
        json['backgroundColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      resizeToAvoidBottomInset: json['resizeToAvoidBottomInset'],
      primary: json['primary'],
      extendBody: json['extendBody'],
      extendBodyBehindAppBar: json['extendBodyBehindAppBar'],
      drawerScrimColor: colorFromHex(
        json['drawerScrimColor'],
        brightness: brightness,
        valueResolver: valueResolver,
      ),
      drawerEdgeDragWidth: (json['drawerEdgeDragWidth'] as num?)?.toDouble(),
      drawerEnableOpenDragGesture: json['drawerEnableOpenDragGesture'],
      endDrawerEnableOpenDragGesture: json['endDrawerEnableOpenDragGesture'],
      drawerDragStartBehavior: json['drawerDragStartBehavior'] != null
          ? DragStartBehavior.values[json['drawerDragStartBehavior']]
          : null,
      bottomSheet: json['bottomSheet'],
      restorationId: json['restorationId'],
      widgetType: json['widgetType'] ?? 'ServerScaffold',
    );
  }
  Key? key;
  Map<String, dynamic>? appBar;
  Map<String, dynamic>? body;
  Map<String, dynamic>? floatingActionButton;
  FloatingActionButtonLocation? floatingActionButtonLocation;
  FloatingActionButtonAnimator? floatingActionButtonAnimator;
  List<Map<String, dynamic>>? persistentFooterButtons;
  Map<String, dynamic>? drawer;
  ValueChanged<bool>? onDrawerChanged;
  Map<String, dynamic>? endDrawer;
  ValueChanged<bool>? onEndDrawerChanged;
  Map<String, dynamic>? bottomNavigationBar;
  Map<String, dynamic>? bottomSheet;
  Color? backgroundColor;
  bool? resizeToAvoidBottomInset;
  bool? primary;
  bool? extendBody;
  bool? extendBodyBehindAppBar;
  Color? drawerScrimColor;
  double? drawerEdgeDragWidth;
  bool? drawerEnableOpenDragGesture;
  bool? endDrawerEnableOpenDragGesture;
  DragStartBehavior? drawerDragStartBehavior;
  String? restorationId;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'appBar': appBar,
      'body': body,
      'floatingActionButton': floatingActionButton,
      'floatingActionButtonLocation': _floatingActionButtonLocationToJson(
        floatingActionButtonLocation,
      ),
      'floatingActionButtonAnimator': _floatingActionButtonAnimatorToJson(
        floatingActionButtonAnimator,
      ),
      'persistentFooterButtons': persistentFooterButtons,
      'drawer': drawer,
      'onDrawerChanged': onDrawerChanged != null ? true : null,
      'endDrawer': endDrawer,
      'onEndDrawerChanged': onEndDrawerChanged != null ? true : null,
      'bottomNavigationBar': bottomNavigationBar,
      'backgroundColor': colorToHex(backgroundColor),
      'resizeToAvoidBottomInset': resizeToAvoidBottomInset,
      'primary': primary,
      'extendBody': extendBody,
      'extendBodyBehindAppBar': extendBodyBehindAppBar,
      'drawerScrimColor': colorToHex(drawerScrimColor),
      'drawerEdgeDragWidth': drawerEdgeDragWidth,
      'drawerEnableOpenDragGesture': drawerEnableOpenDragGesture,
      'endDrawerEnableOpenDragGesture': endDrawerEnableOpenDragGesture,
      'drawerDragStartBehavior': drawerDragStartBehavior?.index,
      'bottomSheet': bottomSheet,
      'restorationId': restorationId,
    };
  }

  Scaffold toWidget({
    AppBar? appBarWidget,
    Widget? bodyWidget,
    Widget? floatingActionButtonWidget,
    List<Widget>? persistentFooterButtonsWidgets,
    Widget? drawerWidget,
    ValueChanged<bool>? onDrawerChangedCallback,
    Widget? endDrawerWidget,
    ValueChanged<bool>? onEndDrawerChangedCallback,
    Widget? bottomNavigationBarWidget,
    Widget? bottomSheetWidget,
  }) {
    return Scaffold(
      key: key,
      appBar: appBarWidget,
      body: bodyWidget,
      floatingActionButton: floatingActionButtonWidget,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtonsWidgets,
      drawer: drawerWidget,
      onDrawerChanged: onDrawerChangedCallback ?? onDrawerChanged,
      endDrawer: endDrawerWidget,
      onEndDrawerChanged: onEndDrawerChangedCallback ?? onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBarWidget,
      bottomSheet: bottomSheetWidget,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      primary: primary ?? true,
      extendBody: extendBody ?? false,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture ?? true,
      drawerDragStartBehavior:
          drawerDragStartBehavior ?? DragStartBehavior.start,
      restorationId: restorationId,
    );
  }
}
