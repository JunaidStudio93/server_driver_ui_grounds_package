import 'package:flutter/material.dart';

class ServerActionHandler {
  ServerActionHandler({
    required this.onAction,
  });

  final void Function(String actionId) onAction;

  VoidCallback? getAction(String? actionId) {
    if (actionId == null) {
      return null;
    }
    return () => onAction(actionId);
  }
}

