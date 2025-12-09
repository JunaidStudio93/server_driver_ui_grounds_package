import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds/server_driver_ui/json_to_widget.dart'
    show ServerDrivenUI;
import 'package:server_driver_ui_grounds/server_driver_ui/ui_models/server_helper.dart';

class ServerExtendedCachedNetworkImage {
  ServerExtendedCachedNetworkImage({
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.cacheKey,
    this.alignment = Alignment.center,
    this.retryImageLoadLimit = 3,
    this.memoryManagementLevel = 0, // 0 = normal
    this.initialRetryDelay = const Duration(milliseconds: 500),
    this.hasPlaceholder = false,
    this.hasErrorWidget = false,
    this.placeholderWidget,
    this.errorWidget,
    this.widgetType = 'ServerExtendedCachedNetworkImage',
  });

  factory ServerExtendedCachedNetworkImage.fromJson(Map<String, dynamic> json) {
    return ServerExtendedCachedNetworkImage(
      imageUrl: json['imageUrl'],
      fit: json['fit'] != null ? BoxFit.values[json['fit']] : null,
      width: SizeValue.fromJson(json['width']),
      height: SizeValue.fromJson(json['height']),
      cacheKey: json['cacheKey'],
      alignment: json['alignment'] != null
          ? Alignment(
              json['alignment']['x']?.toDouble() ?? 0.0,
              json['alignment']['y']?.toDouble() ?? 0.0,
            )
          : Alignment.center,
      retryImageLoadLimit: json['retryImageLoadLimit'] ?? 3,
      memoryManagementLevel: json['memoryManagementLevel'] ?? 0, // 0 = normal
      initialRetryDelay: json['initialRetryDelay'] != null
          ? Duration(milliseconds: json['initialRetryDelay'])
          : const Duration(milliseconds: 500),
      hasPlaceholder: json['hasPlaceholder'] ?? false,
      hasErrorWidget: json['hasErrorWidget'] ?? false,
      placeholderWidget: json['placeholderWidget'] != null
          ? json['placeholderWidget'] as Map<String, dynamic>
          : null,
      errorWidget: json['errorWidget'] != null
          ? json['errorWidget'] as Map<String, dynamic>
          : null,
      widgetType: json['widgetType'] ?? 'ServerExtendedCachedNetworkImage',
    );
  }
  final String imageUrl;
  final BoxFit? fit;
  final SizeValue? width;
  final SizeValue? height;
  final String? cacheKey;
  final Alignment alignment;
  final int retryImageLoadLimit;
  final int memoryManagementLevel; // Using int instead of enum
  final Duration initialRetryDelay;
  final bool hasPlaceholder;
  final bool hasErrorWidget;
  final Map<String, dynamic>? placeholderWidget;
  final Map<String, dynamic>? errorWidget;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'imageUrl': imageUrl,
      'fit': fit?.index,
      'width': width?.toJson(),
      'height': height?.toJson(),
      'cacheKey': cacheKey,
      'alignment': {'x': alignment.x, 'y': alignment.y},
      'retryImageLoadLimit': retryImageLoadLimit,
      'memoryManagementLevel': memoryManagementLevel,
      'initialRetryDelay': initialRetryDelay.inMilliseconds,
      'hasPlaceholder': hasPlaceholder,
      'hasErrorWidget': hasErrorWidget,
      'placeholderWidget': placeholderWidget,
      'errorWidget': errorWidget,
    };
  }

  Widget toWidget({
    Widget Function(BuildContext, String)? placeholder,
    Widget Function(BuildContext, String, dynamic)? errorWidget,
    Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
    Duration? placeholderFadeInDuration,
  }) {
    Widget Function(BuildContext, String)? parsedPlaceholder;
    Widget Function(BuildContext, String, dynamic)? parsedErrorWidget;

    if (placeholderWidget != null) {
      parsedPlaceholder = (context, url) =>
          ServerDrivenUI.parseWidgetFromJson(placeholderWidget!);
    }

    if (this.errorWidget != null) {
      parsedErrorWidget = (context, url, error) =>
          ServerDrivenUI.parseWidgetFromJson(this.errorWidget!);
    }

    return Builder(
      builder: (context) {
        final resolvedWidth = width?.resolve(context);
        final resolvedHeight = height?.resolveHeight(context);
        // Using standard Image.network instead of ExtendedCachedNetworkImage
        return Image.network(
          imageUrl,
          fit: fit,
          width: resolvedWidth,
          height: resolvedHeight,
          alignment: alignment,
          errorBuilder: errorWidget != null || parsedErrorWidget != null
              ? (context, error, stackTrace) {
                  if (parsedErrorWidget != null) {
                    return parsedErrorWidget(context, imageUrl, error);
                  }
                  if (errorWidget != null) {
                    return errorWidget(context, imageUrl, error);
                  }
                  return const SizedBox();
                }
              : null,
          loadingBuilder: placeholder != null || parsedPlaceholder != null
              ? (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  if (parsedPlaceholder != null) {
                    return parsedPlaceholder(context, imageUrl);
                  }
                  if (placeholder != null) {
                    return placeholder(context, imageUrl);
                  }
                  return child;
                }
              : null,
        );
      },
    );
  }
}
