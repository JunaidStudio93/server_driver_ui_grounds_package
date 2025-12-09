import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_text.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_helper.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_column.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_row.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_stack.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_container.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_expanded.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_wrap.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_clip_path.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_aspect_ratio.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_positioned.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_opacity.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_visibility.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_safe_area.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_divider.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_spacer.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_card.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_inkwell.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_gesture_detector.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_dacorated_box.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_cliprrect.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_rich_text.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_vertical_divider.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_scroll_configuration.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_scaffold.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_sizedbox.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_space.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_align.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_padding.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_center.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_appbar.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_drawer.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_floating_action_button.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_elevated_button.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_icon_button.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_icon.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_svg.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_asset_image.dart';

class WidgetToJson {
  WidgetToJson._();

  static Map<String, dynamic> convert(Widget widget) {
    if (widget is Text) {
      return ServerText(
        data: widget.data ?? '',
        key: widget.key,
        style: widget.style,
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        locale: widget.locale,
        softWrap: widget.softWrap,
        overflow: widget.overflow,
        textScaleFactor: widget.textScaleFactor,
        maxLines: widget.maxLines,
        semanticsLabel: widget.semanticsLabel,
        textWidthBasis: widget.textWidthBasis,
        textHeightBehavior: widget.textHeightBehavior,
      ).toJson();
    }

    if (widget is RichText) {
      final textSpan = widget.text is TextSpan
          ? widget.text as TextSpan
          : TextSpan(text: widget.text.toPlainText());
      return ServerRichText(
        text: textSpan,
        key: widget.key,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        softWrap: widget.softWrap,
        overflow: widget.overflow,
        textScaleFactor: widget.textScaleFactor,
        maxLines: widget.maxLines,
        locale: widget.locale,
        strutStyle: widget.strutStyle,
        textWidthBasis: widget.textWidthBasis,
        textHeightBehavior: widget.textHeightBehavior,
        selectionColor: widget.selectionColor,
      ).toJson();
    }

    if (widget is Column) {
      return ServerColumn(
        key: widget.key,
        mainAxisAlignment: widget.mainAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        crossAxisAlignment: widget.crossAxisAlignment,
        textDirection: widget.textDirection,
        verticalDirection: widget.verticalDirection,
        textBaseline: widget.textBaseline,
        children: widget.children.map((child) => convert(child)).toList(),
      ).toJson();
    }

    if (widget is Row) {
      return ServerRow(
        key: widget.key,
        mainAxisAlignment: widget.mainAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        crossAxisAlignment: widget.crossAxisAlignment,
        textDirection: widget.textDirection,
        verticalDirection: widget.verticalDirection,
        textBaseline: widget.textBaseline,
        children: widget.children.map((child) => convert(child)).toList(),
      ).toJson();
    }

    if (widget is Stack) {
      return ServerStack(
        alignment: widget.alignment,
        textDirection: widget.textDirection,
        fit: widget.fit,
        clipBehavior: widget.clipBehavior,
        children: widget.children.map((child) => convert(child)).toList(),
      ).toJson();
    }

    if (widget is SizedBox) {
      final childJson = widget.child != null ? convert(widget.child!) : null;
      return ServerSizedBox(
        key: widget.key,
        width: widget.width != null ? SizeValue(value: widget.width) : null,
        height: widget.height != null ? SizeValue(value: widget.height) : null,
        child: childJson,
      ).toJson();
    }

    if (widget is Container) {
      final childJson = widget.child != null ? convert(widget.child!) : null;
      final constraints = widget.constraints;
      double? width;
      double? height;

      if (constraints != null) {
        if (constraints.minWidth == constraints.maxWidth &&
            constraints.minWidth != double.infinity &&
            constraints.minWidth > 0) {
          width = constraints.minWidth;
        }
        if (constraints.minHeight == constraints.maxHeight &&
            constraints.minHeight != double.infinity &&
            constraints.minHeight > 0) {
          height = constraints.minHeight;
        }
      }

      EdgeInsetsGeometry? padding = widget.padding;
      EdgeInsets? resolvedPadding;
      if (padding != null) {
        if (padding is EdgeInsets) {
          resolvedPadding = padding;
        } else {
          resolvedPadding = padding.resolve(TextDirection.ltr);
        }
      }

      EdgeInsetsGeometry? margin = widget.margin;
      EdgeInsets? resolvedMargin;
      if (margin != null) {
        if (margin is EdgeInsets) {
          resolvedMargin = margin;
        } else {
          resolvedMargin = margin.resolve(TextDirection.ltr);
        }
      }

      AlignmentGeometry? alignment = widget.alignment;
      Alignment? resolvedAlignment;
      if (alignment != null) {
        if (alignment is Alignment) {
          resolvedAlignment = alignment;
        } else {
          resolvedAlignment = alignment.resolve(TextDirection.ltr);
        }
      }

      AlignmentGeometry? transformAlignment = widget.transformAlignment;
      Alignment? resolvedTransformAlignment;
      if (transformAlignment != null) {
        if (transformAlignment is Alignment) {
          resolvedTransformAlignment = transformAlignment;
        } else {
          resolvedTransformAlignment = transformAlignment.resolve(
            TextDirection.ltr,
          );
        }
      }

      return ServerContainer(
        alignment: resolvedAlignment,
        padding: resolvedPadding,
        color: widget.color,
        decoration: widget.decoration,
        foregroundDecoration: widget.foregroundDecoration,
        width: width != null ? SizeValue(value: width) : null,
        height: height != null ? SizeValue(value: height) : null,
        constraints: constraints,
        margin: resolvedMargin,
        transform: widget.transform,
        transformAlignment: resolvedTransformAlignment,
        child: childJson,
      ).toJson();
    }

    if (widget is Padding) {
      EdgeInsetsGeometry padding = widget.padding;
      EdgeInsets resolvedPadding;
      if (padding is EdgeInsets) {
        resolvedPadding = padding;
      } else {
        resolvedPadding = padding.resolve(TextDirection.ltr);
      }

      return ServerPadding(
        key: widget.key,
        padding: resolvedPadding,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is Center) {
      return ServerCenter(
        key: widget.key,
        widthFactor: widget.widthFactor,
        heightFactor: widget.heightFactor,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is Align) {
      AlignmentGeometry alignment = widget.alignment;
      Alignment resolvedAlignment;
      if (alignment is Alignment) {
        resolvedAlignment = alignment;
      } else {
        resolvedAlignment = alignment.resolve(TextDirection.ltr);
      }

      return ServerAlign(
        key: widget.key,
        alignment: resolvedAlignment,
        widthFactor: widget.widthFactor,
        heightFactor: widget.heightFactor,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is Expanded) {
      return ServerExpanded(
        key: widget.key,
        flex: widget.flex,
        child: convert(widget.child),
      ).toJson();
    }

    if (widget is Flexible) {
      return ServerFlexible(
        key: widget.key,
        flex: widget.flex,
        fit: widget.fit,
        child: convert(widget.child),
      ).toJson();
    }

    if (widget is Wrap) {
      return ServerWrap(
        direction: widget.direction,
        alignment: widget.alignment,
        spacing: widget.spacing,
        runSpacing: widget.runSpacing,
        crossAxisAlignment: widget.crossAxisAlignment,
        textDirection: widget.textDirection,
        verticalDirection: widget.verticalDirection,
        clipBehavior: widget.clipBehavior,
        children: widget.children.map((child) => convert(child)).toList(),
      ).toJson();
    }

    if (widget is AspectRatio) {
      return ServerAspectRatio(
        key: widget.key,
        aspectRatio: widget.aspectRatio,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is Positioned) {
      return ServerPositioned(
        key: widget.key,
        left: widget.left,
        top: widget.top,
        right: widget.right,
        bottom: widget.bottom,
        width: widget.width,
        height: widget.height,
        child: convert(widget.child),
      ).toJson();
    }

    if (widget is Opacity) {
      return ServerOpacity(
        key: widget.key,
        opacity: widget.opacity,
        alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is Visibility) {
      final childJson = convert(widget.child);
      final replacementJson = widget.replacement != const SizedBox.shrink()
          ? convert(widget.replacement)
          : null;
      return ServerVisibility(
        key: widget.key,
        visible: widget.visible,
        maintainState: widget.maintainState,
        maintainAnimation: widget.maintainAnimation,
        maintainSize: widget.maintainSize,
        maintainInteractivity: widget.maintainInteractivity,
        replacement: replacementJson,
        child: childJson,
      ).toJson();
    }

    if (widget is SafeArea) {
      return ServerSafeArea(
        key: widget.key,
        left: widget.left,
        top: widget.top,
        right: widget.right,
        bottom: widget.bottom,
        minimum: widget.minimum,
        maintainBottomViewPadding: widget.maintainBottomViewPadding,
        child: convert(widget.child),
      ).toJson();
    }

    if (widget is Divider) {
      return ServerDivider(
        key: widget.key,
        height: widget.height,
        thickness: widget.thickness,
        indent: widget.indent,
        endIndent: widget.endIndent,
        color: widget.color,
      ).toJson();
    }

    if (widget is VerticalDivider) {
      return ServerVerticalDivider(
        key: widget.key,
        width: widget.width,
        thickness: widget.thickness,
        indent: widget.indent,
        endIndent: widget.endIndent,
        color: widget.color,
      ).toJson();
    }

    if (widget is Spacer) {
      return ServerSpacer(key: widget.key, flex: widget.flex).toJson();
    }

    if (widget is Card) {
      return ServerCard(
        key: widget.key,
        color: widget.color,
        shadowColor: widget.shadowColor,
        elevation: widget.elevation,
        shape: widget.shape,
        borderOnForeground: widget.borderOnForeground,
        margin: widget.margin,
        clipBehavior: widget.clipBehavior,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is InkWell) {
      return ServerInkWell(
        key: widget.key,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is GestureDetector) {
      return ServerGestureDetector(
        key: widget.key,
        onTapActionId: widget.onTap != null ? 'onTap' : null,
        onLongPressActionId: widget.onLongPress != null ? 'onLongPress' : null,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is DecoratedBox) {
      return ServerDecoratedBox(
        key: widget.key,
        decoration: widget.decoration,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is ClipRRect) {
      return ServerClipRRect(
        key: widget.key,
        borderRadius: widget.borderRadius,
        clipBehavior: widget.clipBehavior,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is ClipPath) {
      // DiagonalNotchClipper is not available - handle generic clipper
      // if (clipper is DiagonalNotchClipper) {
      //   return ServerClipPath(
      //     key: widget.key,
      //     clipper: ServerCustomClipper(
      //       type: 'diagonalNotch',
      //       notchSize: clipper.notchSize,
      //     ).toCustomClipper(),
      //     clipBehavior: widget.clipBehavior,
      //     child: widget.child != null ? convert(widget.child!) : null,
      //   ).toJson();
      // }
      return ServerClipPath(
        key: widget.key,
        clipper: null,
        clipBehavior: widget.clipBehavior,
        child: widget.child != null ? convert(widget.child!) : null,
      ).toJson();
    }

    if (widget is SingleChildScrollView) {
      final childJson = widget.child != null ? convert(widget.child!) : null;
      return {
        'widgetType': 'ServerSingleChildScrollView',
        'key': widget.key?.toString(),
        'scrollDirection': widget.scrollDirection.index,
        'reverse': widget.reverse,
        'padding': widget.padding != null && widget.padding is EdgeInsets
            ? {
                'left': (widget.padding! as EdgeInsets).left,
                'top': (widget.padding! as EdgeInsets).top,
                'right': (widget.padding! as EdgeInsets).right,
                'bottom': (widget.padding! as EdgeInsets).bottom,
              }
            : null,
        'primary': widget.primary,
        'physics': widget.physics?.runtimeType.toString(),
        'child': childJson,
      };
    }

    if (widget is ScrollConfiguration) {
      return ServerScrollConfiguration(
        key: widget.key,
        behavior: widget.behavior,
        child: convert(widget.child),
      ).toJson();
    }

    if (widget is Scaffold) {
      final serverScaffold = ServerScaffold(
        appBar: widget.appBar != null ? convert(widget.appBar!) : null,
        body: widget.body != null ? convert(widget.body!) : null,
        floatingActionButton: widget.floatingActionButton != null
            ? convert(widget.floatingActionButton!)
            : null,
        persistentFooterButtons: widget.persistentFooterButtons
            ?.map((child) => convert(child))
            .toList(),
        drawer: widget.drawer != null ? convert(widget.drawer!) : null,
        endDrawer: widget.endDrawer != null ? convert(widget.endDrawer!) : null,
        bottomNavigationBar: widget.bottomNavigationBar != null
            ? convert(widget.bottomNavigationBar!)
            : null,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        primary: widget.primary,
        extendBody: widget.extendBody,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        drawerScrimColor: widget.drawerScrimColor,
        drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
      );
      return serverScaffold.toJson();
    }

    if (widget is SizedBox && widget.width == null && widget.height == null) {
      return ServerSpace.both().toJson();
    }

    final widgetTypeName = widget.runtimeType.toString();

    // External widget classes are not available - commented out
    // if (widget is LoadingOverlay) {
    //   return _convertLoadingOverlay(widget);
    // }

    // if (widget is ExtendedCachedNetworkImage) {
    //   return _convertExtendedCachedNetworkImage(widget);
    // }

    // if (widget is LoadingShimmerCard) {
    //   return _convertLoadingShimmerCard(widget);
    // }

    if (widgetTypeName.contains('SvgPicture') ||
        widgetTypeName == 'SvgPicture') {
      return _convertSvgPicture(widget);
    }

    if (widget is Image) {
      final imageProvider = widget.image;
      if (imageProvider is AssetImage) {
        return _convertImageAsset(widget, imageProvider);
      }
    }

    if (widget is AppBar) {
      return _convertAppBar(widget);
    }

    if (widget is Drawer) {
      return _convertDrawer(widget);
    }

    if (widget is FloatingActionButton) {
      return _convertFloatingActionButton(widget);
    }

    if (widget is ElevatedButton) {
      return _convertElevatedButton(widget);
    }

    if (widget is IconButton) {
      return _convertIconButton(widget);
    }

    if (widget is Icon) {
      return ServerIcon(
        key: widget.key,
        icon: widget.icon ?? Icons.help_outline,
        size: widget.size,
        color: widget.color,
        semanticLabel: widget.semanticLabel,
        textDirection: widget.textDirection,
      ).toJson();
    }

    // if (widget is CustomAppButton) {
    //   return _convertCustomAppButton(widget);
    // }

    return {'widgetType': 'Unknown', 'type': widget.runtimeType.toString()};
  }

  // External widget classes are not available - methods commented out
  // static Map<String, dynamic> _convertLoadingOverlay(LoadingOverlay widget) {
  //   final childJson = widget.child != null ? convert(widget.child!) : null;
  //
  //   return ServerLoadingOverlay(
  //     isLoading: widget.isLoading,
  //     child: childJson,
  //     isShowLoader: widget.isShowLoader,
  //     showSyncingText: widget.showSyncingText,
  //   ).toJson();
  // }

  // static Map<String, dynamic> _convertExtendedCachedNetworkImage(
  //   ExtendedCachedNetworkImage widget,
  // ) {
  //   final placeholderJson = _tryConvertPlaceholder(widget.placeholder);
  //   final errorWidgetJson = _tryConvertErrorWidget(widget.errorWidget);
  //
  //   return ServerExtendedCachedNetworkImage(
  //     imageUrl: widget.imageUrl,
  //     fit: widget.fit,
  //     width: widget.width != null ? SizeValue(value: widget.width) : null,
  //     height: widget.height != null ? SizeValue(value: widget.height) : null,
  //     cacheKey: widget.cacheKey,
  //     alignment: widget.alignment,
  //     retryImageLoadLimit: widget.retryImageLoadLimit,
  //     memoryManagementLevel: widget.memoryManagementLevel,
  //     initialRetryDelay: widget.initialRetryDelay,
  //     hasPlaceholder: placeholderJson != null,
  //     hasErrorWidget: errorWidgetJson != null,
  //     placeholderWidget: placeholderJson,
  //     errorWidget: errorWidgetJson,
  //   ).toJson();
  // }

  // static Map<String, dynamic> _convertLoadingShimmerCard(
  //   LoadingShimmerCard widget,
  // ) {
  //   return ServerLoadingShimmerCard(
  //     isForPosts: widget.isForPosts,
  //     height: widget.height,
  //     width: widget.width,
  //     decoration: widget.decoration,
  //     borderRadius: widget.borderRadius,
  //     baseColor: widget.baseColor,
  //     highlightColor: widget.highlightColor,
  //     radius: widget.radius,
  //   ).toJson();
  // }

  static Map<String, dynamic> _convertSvgPicture(Widget widget) {
    try {
      final svgPicture = widget as dynamic;
      String assetName = 'unknown';

      try {
        final bytesLoader = svgPicture.bytesLoader;
        if (bytesLoader != null) {
          final loaderType = bytesLoader.runtimeType.toString();
          if (loaderType.contains('AssetBytesLoader') ||
              loaderType.contains('AssetProvider')) {
            if (bytesLoader.assetName != null) {
              assetName = bytesLoader.assetName as String;
            } else if (bytesLoader._assetName != null) {
              assetName = bytesLoader._assetName as String;
            } else {
              final loaderString = bytesLoader.toString();
              final match = RegExp(r"'([^']+)'").firstMatch(loaderString);
              if (match != null) {
                assetName = match.group(1)!;
              }
            }
          } else {
            assetName = _extractSvgAssetName(bytesLoader);
          }
        }
      } catch (e) {
        assetName = _extractSvgAssetName(svgPicture);
      }

      double? width;
      double? height;
      Color? color;
      BoxFit fit = BoxFit.contain;
      Alignment alignment = Alignment.center;

      try {
        if (svgPicture.width != null) {
          width = svgPicture.width is double
              ? svgPicture.width
              : (svgPicture.width as num).toDouble();
        }
      } catch (e) {}

      try {
        if (svgPicture.height != null) {
          height = svgPicture.height is double
              ? svgPicture.height
              : (svgPicture.height as num).toDouble();
        }
      } catch (e) {}

      try {
        if (svgPicture.colorFilter != null) {
          final colorFilter = svgPicture.colorFilter as dynamic;
          if (colorFilter.color != null) {
            color = colorFilter.color as Color;
          } else if (colorFilter.mode != null && colorFilter.color != null) {
            color = colorFilter.color as Color;
          }
        }
      } catch (e) {}

      try {
        if (svgPicture.fit != null) {
          fit = svgPicture.fit as BoxFit;
        }
      } catch (e) {}

      try {
        if (svgPicture.alignment != null) {
          alignment = svgPicture.alignment is Alignment
              ? svgPicture.alignment as Alignment
              : Alignment.center;
        }
      } catch (e) {}

      return ServerSvgAsset(
        key: widget.key,
        assetName: assetName,
        width: width != null ? SizeValue(value: width) : null,
        height: height != null ? SizeValue(value: height) : null,
        color: color,
        fit: fit,
        alignment: alignment,
      ).toJson();
    } catch (e) {
      return {
        'widgetType': 'ServerSvgAsset',
        'assetName': 'unknown',
        'error': e.toString(),
      };
    }
  }

  static Map<String, dynamic> _convertImageAsset(
    Image widget,
    AssetImage imageProvider,
  ) {
    return ServerImageAsset(
      key: widget.key,
      assetName: imageProvider.assetName,
      width: widget.width != null ? SizeValue(value: widget.width) : null,
      height: widget.height != null ? SizeValue(value: widget.height) : null,
      fit: widget.fit,
      alignment: widget.alignment,
    ).toJson();
  }

  // static Map<String, dynamic> _convertCustomAppButton(CustomAppButton widget) {
  //   String? iconName;
  //   String? suffixIconName;
  //
  //   if (widget.icon != null) {
  //     iconName = _extractSvgAssetName(widget.icon!);
  //   }
  //
  //   if (widget.suffixIcon != null) {
  //     suffixIconName = _extractSvgAssetName(widget.suffixIcon!);
  //   }
  //
  //   final suffixWidgetJson = widget.suffixWidget != null
  //       ? convert(widget.suffixWidget!)
  //       : null;
  //
  //   EdgeInsets? resolvedPadding;
  //   if (widget.padding != null) {
  //     if (widget.padding is EdgeInsets) {
  //       resolvedPadding = widget.padding as EdgeInsets;
  //     } else {
  //       resolvedPadding = widget.padding!.resolve(TextDirection.ltr);
  //     }
  //   }
  //
  //   return ServerCustomAppButton(
  //     buttonText: widget.buttonText,
  //     width: widget.width != null ? SizeValue(value: widget.width) : null,
  //     height: widget.height != null ? SizeValue(value: widget.height) : null,
  //     buttonColor: widget.buttonColor,
  //     buttonTextColor: widget.buttonTextColor,
  //     showLoader: widget.showLoader,
  //     iconName: iconName,
  //     suffixIconName: suffixIconName,
  //     iconColor: widget.iconColor,
  //     textSize: widget.textSize,
  //     textFontWeight: widget.textFontWeight,
  //     showBorder: widget.showBorder,
  //     borderColor: widget.borderColor,
  //     disableColor: widget.disableColor,
  //     minSize: widget.minSize,
  //     padding: resolvedPadding,
  //     textLetterSpacing: widget.textLetterSpacing,
  //     suffixIconSize: widget.suffixIconSize,
  //     disabledTextColor: widget.disabledTextColor,
  //     hasSuffixWidget: suffixWidgetJson != null,
  //     onTapActionId: widget.onTap != null ? 'onTap' : null,
  //   ).toJson();
  // }

  static Map<String, dynamic> _convertAppBar(AppBar widget) {
    return ServerAppBar(
      key: widget.key,
      leading: widget.leading != null ? convert(widget.leading!) : null,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: widget.title != null ? convert(widget.title!) : null,
      actions: widget.actions?.map((action) => convert(action)).toList(),
      flexibleSpace: widget.flexibleSpace != null
          ? convert(widget.flexibleSpace!)
          : null,
      bottom: widget.bottom != null ? convert(widget.bottom!) : null,
      elevation: widget.elevation,
      scrolledUnderElevation: widget.scrolledUnderElevation,
      shadowColor: widget.shadowColor,
      surfaceTintColor: widget.surfaceTintColor,
      shape: widget.shape,
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      iconTheme: widget.iconTheme,
      actionsIconTheme: widget.actionsIconTheme,
      primary: widget.primary,
      centerTitle: widget.centerTitle,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      titleSpacing: widget.titleSpacing,
      toolbarOpacity: widget.toolbarOpacity,
      bottomOpacity: widget.bottomOpacity,
      toolbarHeight: widget.toolbarHeight,
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: widget.toolbarTextStyle,
      titleTextStyle: widget.titleTextStyle,
      systemOverlayStyle: widget.systemOverlayStyle,
    ).toJson();
  }

  static Map<String, dynamic> _convertDrawer(Drawer widget) {
    return ServerDrawer(
      key: widget.key,
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColor,
      surfaceTintColor: widget.surfaceTintColor,
      shadowColor: widget.shadowColor,
      semanticLabel: widget.semanticLabel,
      width: widget.width,
      child: widget.child != null ? convert(widget.child!) : null,
      shape: widget.shape,
      clipBehavior: widget.clipBehavior ?? Clip.none,
    ).toJson();
  }

  static Map<String, dynamic> _convertFloatingActionButton(
    FloatingActionButton widget,
  ) {
    return ServerFloatingActionButton(
      key: widget.key,
      child: widget.child != null ? convert(widget.child!) : null,
      tooltip: widget.tooltip,
      foregroundColor: widget.foregroundColor,
      backgroundColor: widget.backgroundColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      splashColor: widget.splashColor,
      heroTag: widget.heroTag,
      elevation: widget.elevation,
      focusElevation: widget.focusElevation,
      hoverElevation: widget.hoverElevation,
      highlightElevation: widget.highlightElevation,
      disabledElevation: widget.disabledElevation,
      onPressed: widget.onPressed,
      mouseCursor: widget.mouseCursor,
      mini: widget.mini,
      shape: widget.shape,
      clipBehavior: widget.clipBehavior,
      autofocus: widget.autofocus,
      isExtended: false, // Regular FAB, not extended
      materialTapTargetSize: widget.materialTapTargetSize,
      extendedPadding: null,
      extendedIconLabelSpacing: null,
    ).toJson();
  }

  static Map<String, dynamic> _convertElevatedButton(ElevatedButton widget) {
    return ServerElevatedButton(
      key: widget.key,
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      style: widget.style,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior ?? Clip.none,
      statesController: widget.statesController,
      child: widget.child != null ? convert(widget.child!) : null,
    ).toJson();
  }

  static Map<String, dynamic> _convertIconButton(IconButton widget) {
    IconData iconData = Icons.help_outline;
    if (widget.icon is Icon) {
      final iconWidget = widget.icon as Icon;
      iconData = iconWidget.icon ?? Icons.help_outline;
    }

    IconData? selectedIconData;
    if (widget.selectedIcon is Icon) {
      final selectedIconWidget = widget.selectedIcon as Icon;
      selectedIconData = selectedIconWidget.icon;
    }

    return ServerIconButton(
      key: widget.key,
      icon: iconData,
      iconSize: widget.iconSize,
      visualDensity: widget.visualDensity,
      padding: widget.padding,
      alignment: widget.alignment,
      splashRadius: widget.splashRadius,
      color: widget.color,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      splashColor: widget.splashColor,
      disabledColor: widget.disabledColor,
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      mouseCursor: widget.mouseCursor,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      tooltip: widget.tooltip,
      enableFeedback: widget.enableFeedback ?? true,
      constraints: widget.constraints,
      style: widget.style != null
          ? IconButtonThemeData(style: widget.style)
          : null,
      isSelected: widget.isSelected,
      selectedIcon: selectedIconData,
    ).toJson();
  }

  static String _extractSvgAssetName(dynamic svgAsset) {
    try {
      if (svgAsset.path != null) {
        return svgAsset.path as String;
      }
      if (svgAsset.assetName != null) {
        return svgAsset.assetName as String;
      }
      if (svgAsset._assetName != null) {
        return svgAsset._assetName as String;
      }
      final toString = svgAsset.toString();
      final match = RegExp(r"'([^']+)'").firstMatch(toString);
      if (match != null) {
        return match.group(1)!;
      }
    } catch (e) {}
    return 'unknown';
  }

  // Unused helper methods commented out - they were for external widgets
  // static Map<String, dynamic>? _tryConvertPlaceholder(
  //   Widget Function(BuildContext, String)? placeholder,
  // ) {
  //   if (placeholder == null) return null;
  //   return null;
  // }

  // static Map<String, dynamic>? _tryConvertErrorWidget(
  //   Widget Function(BuildContext, String, dynamic)? errorWidget,
  // ) {
  //   if (errorWidget == null) return null;
  //   return null;
  // }

  static Map<String, dynamic>? convertNullable(Widget? widget) {
    if (widget == null) return null;
    return convert(widget);
  }
}
