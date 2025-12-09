import 'package:flutter/widgets.dart';
import 'server_driver_ui/json_to_widget.dart';

// Export all UI models for convenient access
export 'server_driver_ui/ui_models.dart';

class ServerDriverUiGrounds {
  Widget widgetFromJson({required Map<String, dynamic> json}) {
    return ServerDrivenUI.parseWidgetFromJson(json);
  }
}
