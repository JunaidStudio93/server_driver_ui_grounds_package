import 'package:flutter/widgets.dart';
import 'server_driver_ui/json_to_widget.dart';

// Export all UI models for convenient access
export 'server_driver_ui/ui_models.dart';

// Export all core components
export 'server_driver_ui/action_handler.dart';
export 'server_driver_ui/value_handler.dart';
export 'server_driver_ui/widget_to_json.dart';
export 'server_driver_ui/json_to_widget.dart';

class ServerDriverUiGrounds {
  Widget widgetFromJson({required Map<String, dynamic> json}) {
    return ServerDrivenUI.parseWidgetFromJson(json);
  }
}
