import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/json_to_widget.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_center.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_column.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_container.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_row.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_scaffold.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_text.dart';

class ServerUIBuilder extends StatelessWidget {
  ServerUIBuilder({super.key});

  final Map<String, dynamic> values = {
    //  ''
  };

  @override
  Widget build(BuildContext context) {
    final json = ServerScaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ServerCenter(
        child: ServerColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ServerRow(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ServerContainer(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  //  width: SizeValue(value: 72),
                  // height: SizeValue(value: 26),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffB20D36).withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ServerText(
                    data: '60% OFF',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ).toJson(),
                ).toJson(),
              ],
            ).toJson(),
          ],
        ).toJson(),
      ).toJson(),
    ).toJson();

    log(json.toString());
    return ServerDrivenUI.parseWidgetFromJson(json);
  }

  dynamic getValueById({required String id}) {
    return '';
  }
}
