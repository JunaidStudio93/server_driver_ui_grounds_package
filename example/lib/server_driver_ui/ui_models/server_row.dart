import 'package:flutter/material.dart';

class ServerRow {
  ServerRow({
    this.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.children,
    this.widgetType = 'ServerRow',
  });

  factory ServerRow.fromJson(Map<String, dynamic> json) {
    final mainAxisAlignmentIndex = json['mainAxisAlignment'] as int?;
    final mainAxisSizeIndex = json['mainAxisSize'] as int?;
    final crossAxisAlignmentIndex = json['crossAxisAlignment'] as int?;
    final textDirectionIndex = json['textDirection'] as int?;
    final verticalDirectionIndex = json['verticalDirection'] as int?;
    final textBaselineIndex = json['textBaseline'] as int?;

    return ServerRow(
      key: json['key'] != null ? Key(json['key']) : null,
      mainAxisAlignment: mainAxisAlignmentIndex != null &&
              mainAxisAlignmentIndex >= 0 &&
              mainAxisAlignmentIndex < MainAxisAlignment.values.length
          ? MainAxisAlignment.values[mainAxisAlignmentIndex]
          : MainAxisAlignment.start,
      mainAxisSize: mainAxisSizeIndex != null &&
              mainAxisSizeIndex >= 0 &&
              mainAxisSizeIndex < MainAxisSize.values.length
          ? MainAxisSize.values[mainAxisSizeIndex]
          : MainAxisSize.max,
      crossAxisAlignment: crossAxisAlignmentIndex != null &&
              crossAxisAlignmentIndex >= 0 &&
              crossAxisAlignmentIndex < CrossAxisAlignment.values.length
          ? CrossAxisAlignment.values[crossAxisAlignmentIndex]
          : CrossAxisAlignment.center,
      textDirection: textDirectionIndex != null &&
              textDirectionIndex >= 0 &&
              textDirectionIndex < TextDirection.values.length
          ? TextDirection.values[textDirectionIndex]
          : null,
      verticalDirection: verticalDirectionIndex != null &&
              verticalDirectionIndex >= 0 &&
              verticalDirectionIndex < VerticalDirection.values.length
          ? VerticalDirection.values[verticalDirectionIndex]
          : VerticalDirection.down,
      textBaseline: textBaselineIndex != null &&
              textBaselineIndex >= 0 &&
              textBaselineIndex < TextBaseline.values.length
          ? TextBaseline.values[textBaselineIndex]
          : null,
      children: json['children'],
      widgetType: json['widgetType'] ?? 'ServerRow',
    );
  }
  final Key? key;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Map<String, dynamic>>? children;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'key': key?.toString(),
      'mainAxisAlignment': mainAxisAlignment.index,
      'mainAxisSize': mainAxisSize.index,
      'crossAxisAlignment': crossAxisAlignment.index,
      'textDirection': textDirection?.index,
      'verticalDirection': verticalDirection.index,
      'textBaseline': textBaseline?.index,
      'children': children,
    };
  }

  Widget toWidget({List<Widget>? childrenWidgets}) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: childrenWidgets ?? [],
    );
  }
}
