import 'dart:ui';
import 'package:flutter/material.dart';

class ServerLoadingOverlay {
  ServerLoadingOverlay({
    required this.isLoading,
    this.child,
    this.isShowLoader = true,
    this.showSyncingText = false,
    this.loaderColor,
    this.loaderSize = 50,
    this.syncingText = 'Syncing your data...',
    this.blurSigma = 4.0,
    this.overlayColor,
    this.widgetType = 'ServerLoadingOverlay',
  });

  factory ServerLoadingOverlay.fromJson(Map<String, dynamic> json) {
    return ServerLoadingOverlay(
      isLoading: json['isLoading'] ?? false,
      child: json['child'] != null
          ? json['child'] as Map<String, dynamic>
          : null,
      isShowLoader: json['isShowLoader'] ?? true,
      showSyncingText: json['showSyncingText'] ?? false,
      loaderColor: json['loaderColor'] != null
          ? Color(json['loaderColor'])
          : Colors.blue,
      loaderSize: (json['loaderSize'] as num?)?.toDouble() ?? 50,
      syncingText: json['syncingText'] ?? 'Syncing your data...',
      blurSigma: (json['blurSigma'] as num?)?.toDouble() ?? 4.0,
      overlayColor: json['overlayColor'] != null
          ? Color(json['overlayColor'])
          : Colors.black.withOpacity(0.65),
      widgetType: json['widgetType'] ?? 'ServerLoadingOverlay',
    );
  }

  final bool isLoading;
  final Map<String, dynamic>? child;
  final bool isShowLoader;
  final bool showSyncingText;
  final Color? loaderColor;
  final double loaderSize;
  final String syncingText;
  final double blurSigma;
  final Color? overlayColor;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'isLoading': isLoading,
      'child': child,
      'isShowLoader': isShowLoader,
      'showSyncingText': showSyncingText,
      'loaderColor': loaderColor?.value,
      'loaderSize': loaderSize,
      'syncingText': syncingText,
      'blurSigma': blurSigma,
      'overlayColor': overlayColor?.value,
    };
  }

  Widget toWidget({Widget? childWidget}) {
    return _LoadingOverlayWidget(
      isLoading: isLoading,
      child: childWidget,
      isShowLoader: isShowLoader,
      showSyncingText: showSyncingText,
      loaderColor: loaderColor ?? Colors.blue,
      loaderSize: loaderSize,
      syncingText: syncingText,
      blurSigma: blurSigma,
      overlayColor: overlayColor ?? Colors.black.withOpacity(0.65),
    );
  }
}

class _LoadingOverlayWidget extends StatelessWidget {
  const _LoadingOverlayWidget({
    required this.isLoading,
    this.child,
    required this.isShowLoader,
    required this.showSyncingText,
    required this.loaderColor,
    required this.loaderSize,
    required this.syncingText,
    required this.blurSigma,
    required this.overlayColor,
  });

  final bool isLoading;
  final Widget? child;
  final bool isShowLoader;
  final bool showSyncingText;
  final Color loaderColor;
  final double loaderSize;
  final String syncingText;
  final double blurSigma;
  final Color overlayColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (child != null) child!,
        if (isLoading)
          AbsorbPointer(
            child: Material(
              color: Colors.transparent,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: !isShowLoader ? 0 : blurSigma,
                  sigmaY: !isShowLoader ? 0 : blurSigma,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: !isShowLoader ? Colors.transparent : overlayColor,
                  child: !isShowLoader
                      ? const SizedBox()
                      : Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(
                                color: loaderColor,
                                strokeWidth: loaderSize / 10,
                              ),
                              if (showSyncingText) ...[
                                const SizedBox(height: 12),
                                Text(syncingText),
                              ],
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

