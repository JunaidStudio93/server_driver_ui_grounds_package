import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ServerLoadingShimmerCard {
  ServerLoadingShimmerCard({
    this.isForPosts = false,
    this.height,
    this.width,
    this.decoration,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.radius,
    this.widgetType = 'ServerLoadingShimmerCard',
  });

  factory ServerLoadingShimmerCard.fromJson(Map<String, dynamic> json) {
    final decorationJson = json['decoration'];
    final borderRadiusJson = json['borderRadius'];

    return ServerLoadingShimmerCard(
      isForPosts: json['isForPosts'] ?? false,
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      decoration: decorationJson != null
          ? BoxDecoration(
              color: decorationJson['color'] != null
                  ? Color(decorationJson['color'])
                  : null,
              borderRadius: decorationJson['borderRadius'] != null
                  ? BorderRadius.circular(
                      (decorationJson['borderRadius']['radius'] as num?)
                              ?.toDouble() ??
                          0,
                    )
                  : null,
            )
          : null,
      borderRadius: borderRadiusJson != null
          ? BorderRadius.circular(
              (borderRadiusJson['radius'] as num?)?.toDouble() ?? 0,
            )
          : null,
      baseColor: json['baseColor'] != null
          ? Color(json['baseColor'])
          : Colors.grey.withOpacity(0.2),
      highlightColor: json['highlightColor'] != null
          ? Color(json['highlightColor'])
          : Colors.grey.withOpacity(0.6),
      radius: (json['radius'] as num?)?.toDouble() ?? 23,
      widgetType: json['widgetType'] ?? 'ServerLoadingShimmerCard',
    );
  }

  final bool isForPosts;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final BorderRadius? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;
  final double? radius;
  final String widgetType;

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'isForPosts': isForPosts,
      'height': height,
      'width': width,
      'decoration': decoration != null
          ? {
              'color': decoration!.color?.value,
              'borderRadius': decoration!.borderRadius != null
                  ? {
                      'radius':
                          (decoration!.borderRadius as BorderRadius).topLeft.x,
                    }
                  : null,
            }
          : null,
      'borderRadius': borderRadius != null
          ? {'radius': borderRadius!.topLeft.x}
          : null,
      'baseColor': baseColor?.value,
      'highlightColor': highlightColor?.value,
      'radius': radius,
    };
  }

  Widget toWidget() {
    return _LoadingShimmerCardWidget(
      isForPosts: isForPosts,
      height: height,
      width: width,
      decoration: decoration,
      borderRadius: borderRadius,
      baseColor: baseColor ?? Colors.grey.withOpacity(0.2),
      highlightColor: highlightColor ?? Colors.grey.withOpacity(0.6),
      radius: radius ?? 23,
    );
  }
}

class _LoadingShimmerCardWidget extends StatelessWidget {
  const _LoadingShimmerCardWidget({
    required this.isForPosts,
    this.height,
    this.width,
    this.decoration,
    this.borderRadius,
    required this.baseColor,
    required this.highlightColor,
    required this.radius,
  });

  final bool isForPosts;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final BorderRadius? borderRadius;
  final Color baseColor;
  final Color highlightColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return isForPosts
        ? Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.grey.withOpacity(0.6),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                    left: 22,
                    right: 22,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          height: 0,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 15,
                          width: 130,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          height: 0,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.grey,
                  ),
                  width: width ?? double.infinity,
                  height: MediaQuery.of(context).size.height * 0.41,
                ),
              ],
            ),
          )
        : Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              decoration:
                  decoration ??
                  BoxDecoration(
                    borderRadius: borderRadius ?? BorderRadius.circular(radius),
                    color: Colors.grey,
                  ),
              width: width ?? double.infinity,
              height: height ?? MediaQuery.of(context).size.height * 0.41,
            ),
          );
  }
}
