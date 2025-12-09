import 'package:flutter/widgets.dart';
import 'server_driver_ui/json_to_widget.dart';

class ServerDriverUiGrounds {
  Widget widgetFromJson({required Map<String, dynamic> json}) {
    return ServerDrivenUI.parseWidgetFromJson(json);
  }
}
