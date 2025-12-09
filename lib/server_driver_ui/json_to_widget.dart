import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_text.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_column.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_row.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_stack.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_sizedbox.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_listview.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_listview_builder.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_single_child_scroll_view.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_scaffold.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_custom_app_button.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_images.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_asset_image.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_svg.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_extanded_cache_network_imag.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_cliprrect.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_gesture_detector.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_dacorated_box.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_container.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_expanded.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_wrap.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_aspect_ratio.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_positioned.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_opacity.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_visibility.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_safe_area.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_divider.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_spacer.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_icon.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_card.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_inkwell.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_transform.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_loading_overlay.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_loading_shimmer_card.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_rich_text.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_vertical_divider.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_clip_path.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_scroll_configuration.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_will_pop_scope.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_platform.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_fitted_box.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_intrinsic_width.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_intrinsic_height.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_space.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_align.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_padding.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_center.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_appbar.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_drawer.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_floating_action_button.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_elevated_button.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/ui_models/server_icon_button.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/action_handler.dart';
import 'package:server_driver_ui_grounds_package/server_driver_ui/value_handler.dart';

class ServerDrivenUI {
  ServerDrivenUI._();

  static Widget parseWidgetFromJson(
    Map<String, dynamic> json, {
    ServerActionHandler? actionHandler,
    ServerValueHandler? valueHandler,
    Brightness? brightness,
  }) {
    if (json.isEmpty) {
      return const SizedBox.shrink();
    }

    final widgetType = json['widgetType'] as String? ?? json['type'];

    if (widgetType == null) {
      return const SizedBox.shrink();
    }

    switch (widgetType) {
      case 'ServerText':
        final serverText = ServerText.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );

        // If dataValueId is provided, resolve it using value handler
        // Priority: dataValueId > data (static fallback)
        if (serverText.dataValueId != null && valueHandler != null) {
          final resolvedValue = valueHandler.getString(serverText.dataValueId);
          if (resolvedValue != null) {
            serverText.data = resolvedValue;
          }
          // If resolvedValue is null, keep the static data as fallback
        }

        // Wrap in Builder to resolve theme-aware colors if needed
        return Builder(
          builder: (context) {
            final resolvedBrightness =
                brightness ?? Theme.of(context).brightness;
            return serverText.toWidget(
              brightness: resolvedBrightness,
              valueResolver: valueHandler?.onGetValue,
            );
          },
        );

      case 'ServerColumn':
        final serverColumn = ServerColumn.fromJson(json);
        final children = serverColumn.children != null
            ? serverColumn.children!
                  .map(
                    (item) => parseWidgetFromJson(
                      item,
                      actionHandler: actionHandler,
                      valueHandler: valueHandler,
                      brightness: brightness,
                    ),
                  )
                  .toList()
            : <Widget>[];
        return serverColumn.toWidget(childrenWidgets: children);

      case 'ServerRow':
        final serverRow = ServerRow.fromJson(json);
        final children = serverRow.children != null
            ? serverRow.children!
                  .map(
                    (item) => parseWidgetFromJson(
                      item,
                      actionHandler: actionHandler,
                      valueHandler: valueHandler,
                      brightness: brightness,
                    ),
                  )
                  .toList()
            : <Widget>[];
        return serverRow.toWidget(childrenWidgets: children);

      case 'ServerStack':
        final serverStack = ServerStack.fromJson(json);
        final children = serverStack.children
            .map(
              (item) => parseWidgetFromJson(
                item,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              ),
            )
            .toList();
        return serverStack.toWidget(childWidgets: children);

      case 'ServerSizedBox':
        final serverSizedBox = ServerSizedBox.fromJson(json);
        final child = serverSizedBox.child != null
            ? parseWidgetFromJson(
                serverSizedBox.child!,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
                brightness: brightness,
              )
            : null;
        return serverSizedBox.toWidget(childWidget: child);

      case 'ServerListView':
        return ServerListView.fromJson(json).toWidget();

      case 'ServerListViewBuilder':
        final serverListViewBuilder = ServerListViewBuilder.fromJson(json);
        return serverListViewBuilder.toWidget(
          itemBuilder: (index, data) {
            return parseWidgetFromJson(
              data,
              actionHandler: actionHandler,
              valueHandler: valueHandler,
            );
          },
        );

      case 'ServerSingleChildScrollView':
        final serverSingleChildScrollView =
            ServerSingleChildScrollView.fromJson(json);
        final child = serverSingleChildScrollView.child != null
            ? parseWidgetFromJson(
                serverSingleChildScrollView.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverSingleChildScrollView.toWidget(childWidget: child);

      case 'ServerScaffold':
        final serverScaffold = ServerScaffold.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );
        final appBar = serverScaffold.appBar != null
            ? parseWidgetFromJson(
                    serverScaffold.appBar as Map<String, dynamic>,
                    actionHandler: actionHandler,
                    valueHandler: valueHandler,
                    brightness: brightness,
                  )
                  as AppBar?
            : null;
        final body = serverScaffold.body != null
            ? parseWidgetFromJson(
                serverScaffold.body as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
                brightness: brightness,
              )
            : null;
        final floatingActionButton = serverScaffold.floatingActionButton != null
            ? parseWidgetFromJson(
                serverScaffold.floatingActionButton as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final persistentFooterButtons =
            serverScaffold.persistentFooterButtons != null
            ? (serverScaffold.persistentFooterButtons as List)
                  .map(
                    (item) => parseWidgetFromJson(
                      item as Map<String, dynamic>,
                      actionHandler: actionHandler,
                      valueHandler: valueHandler,
                    ),
                  )
                  .toList()
            : null;
        final drawer = serverScaffold.drawer != null
            ? parseWidgetFromJson(
                serverScaffold.drawer as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final endDrawer = serverScaffold.endDrawer != null
            ? parseWidgetFromJson(
                serverScaffold.endDrawer as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final bottomNavigationBar = serverScaffold.bottomNavigationBar != null
            ? parseWidgetFromJson(
                serverScaffold.bottomNavigationBar as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverScaffold.toWidget(
          appBarWidget: appBar,
          bodyWidget: body,
          floatingActionButtonWidget: floatingActionButton,
          persistentFooterButtonsWidgets: persistentFooterButtons,
          drawerWidget: drawer,
          endDrawerWidget: endDrawer,
          bottomNavigationBarWidget: bottomNavigationBar,
        );

      case 'ServerCustomAppButton':
        final serverButton = ServerCustomAppButton.fromJson(json);
        return serverButton.toWidget(
          onTap: actionHandler?.getAction(serverButton.onTapActionId),
        );

      case 'ServerImage':
        return ServerImage.fromJson(json).toWidget();

      case 'ServerImageAsset':
        return ServerImageAsset.fromJson(json).toWidget();

      case 'ServerSvgAsset':
        return ServerSvgAsset.fromJson(json).toWidget();

      case 'ServerExtendedCachedNetworkImage':
        final serverImage = ServerExtendedCachedNetworkImage.fromJson(json);
        return serverImage.toWidget();

      case 'ServerClipRRect':
        final serverClipRRect = ServerClipRRect.fromJson(json);
        final child = serverClipRRect.child != null
            ? parseWidgetFromJson(
                serverClipRRect.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverClipRRect.toWidget(childWidget: child);

      case 'ServerGestureDetector':
        final serverGestureDetector = ServerGestureDetector.fromJson(json);
        final child = serverGestureDetector.child != null
            ? parseWidgetFromJson(
                serverGestureDetector.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverGestureDetector.toWidget(
          childWidget: child,
          onTapCallback: actionHandler?.getAction(
            serverGestureDetector.onTapActionId,
          ),
          onLongPressCallback: actionHandler?.getAction(
            serverGestureDetector.onLongPressActionId,
          ),
        );

      case 'ServerDecoratedBox':
        final serverDecoratedBox = ServerDecoratedBox.fromJson(json);
        final child = serverDecoratedBox.child != null
            ? parseWidgetFromJson(
                serverDecoratedBox.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverDecoratedBox.toWidget(childWidget: child);

      case 'ServerFittedBox':
        final serverFittedBox = ServerFittedBox.fromJson(json);
        final child = serverFittedBox.child != null
            ? parseWidgetFromJson(
                serverFittedBox.child!,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverFittedBox.toWidget(childWidget: child);

      case 'ServerIntrinsicWidth':
        final serverIntrinsicWidth = ServerIntrinsicWidth.fromJson(json);
        final children = serverIntrinsicWidth.children
            .map(
              (item) => parseWidgetFromJson(
                item,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              ),
            )
            .toList();
        return serverIntrinsicWidth.toWidget(childWidgets: children);

      case 'ServerIntrinsicHeight':
        final serverIntrinsicHeight = ServerIntrinsicHeight.fromJson(json);
        final children = serverIntrinsicHeight.children
            .map(
              (item) => parseWidgetFromJson(
                item,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              ),
            )
            .toList();
        return serverIntrinsicHeight.toWidget(childWidgets: children);

      case 'ServerSpace':
        return ServerSpace.fromJson(json).toWidget();

      case 'ServerAlign':
        final serverAlign = ServerAlign.fromJson(json);
        final child = serverAlign.child != null
            ? parseWidgetFromJson(
                serverAlign.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverAlign.toWidget(childWidget: child);

      case 'ServerPadding':
        final serverPadding = ServerPadding.fromJson(json);
        final child = serverPadding.child != null
            ? parseWidgetFromJson(
                serverPadding.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverPadding.toWidget(childWidget: child);

      case 'ServerCenter':
        final serverCenter = ServerCenter.fromJson(json);
        final child = serverCenter.child != null
            ? parseWidgetFromJson(
                serverCenter.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverCenter.toWidget(childWidget: child);

      case 'ServerContainer':
        final serverContainer = ServerContainer.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );
        final child = serverContainer.child != null
            ? parseWidgetFromJson(
                serverContainer.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
                brightness: brightness,
              )
            : null;
        return serverContainer.toWidget(childWidget: child);

      case 'ServerExpanded':
        final serverExpanded = ServerExpanded.fromJson(json);
        final child = serverExpanded.child != null
            ? parseWidgetFromJson(
                serverExpanded.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverExpanded.toWidget(childWidget: child);

      case 'ServerFlexible':
        final serverFlexible = ServerFlexible.fromJson(json);
        final child = serverFlexible.child != null
            ? parseWidgetFromJson(
                serverFlexible.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverFlexible.toWidget(childWidget: child);

      case 'ServerWrap':
        final serverWrap = ServerWrap.fromJson(json);
        final children = serverWrap.children != null
            ? serverWrap.children!
                  .map(
                    (item) => parseWidgetFromJson(
                      item,
                      actionHandler: actionHandler,
                      valueHandler: valueHandler,
                      brightness: brightness,
                    ),
                  )
                  .toList()
            : <Widget>[];
        return serverWrap.toWidget(childrenWidgets: children);

      case 'ServerAspectRatio':
        final serverAspectRatio = ServerAspectRatio.fromJson(json);
        final child = serverAspectRatio.child != null
            ? parseWidgetFromJson(
                serverAspectRatio.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverAspectRatio.toWidget(childWidget: child);

      case 'ServerPositioned':
        final serverPositioned = ServerPositioned.fromJson(json);
        final child = serverPositioned.child != null
            ? parseWidgetFromJson(
                serverPositioned.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverPositioned.toWidget(childWidget: child);

      case 'ServerOpacity':
        final serverOpacity = ServerOpacity.fromJson(json);
        final child = serverOpacity.child != null
            ? parseWidgetFromJson(
                serverOpacity.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverOpacity.toWidget(childWidget: child);

      case 'ServerVisibility':
        final serverVisibility = ServerVisibility.fromJson(json);
        final child = serverVisibility.child != null
            ? parseWidgetFromJson(
                serverVisibility.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final replacement =
            serverVisibility.replacement != null &&
                serverVisibility.replacement is Map<String, dynamic>
            ? parseWidgetFromJson(
                serverVisibility.replacement as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverVisibility.toWidget(
          childWidget: child,
          replacementWidget: replacement,
        );

      case 'ServerSafeArea':
        final serverSafeArea = ServerSafeArea.fromJson(json);
        final child = serverSafeArea.child != null
            ? parseWidgetFromJson(
                serverSafeArea.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverSafeArea.toWidget(childWidget: child);

      case 'ServerDivider':
        return ServerDivider.fromJson(json).toWidget();

      case 'ServerSpacer':
        return ServerSpacer.fromJson(json).toWidget();

      case 'ServerIcon':
        return ServerIcon.fromJson(json).toWidget();

      case 'ServerAppBar':
        final serverAppBar = ServerAppBar.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );
        final leading = serverAppBar.leading != null
            ? parseWidgetFromJson(
                serverAppBar.leading as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final title = serverAppBar.title != null
            ? parseWidgetFromJson(
                serverAppBar.title as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final actions = serverAppBar.actions
            ?.map(
              (item) => parseWidgetFromJson(
                item,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              ),
            )
            .toList();
        final flexibleSpace = serverAppBar.flexibleSpace != null
            ? parseWidgetFromJson(
                serverAppBar.flexibleSpace as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final bottom = serverAppBar.bottom != null
            ? parseWidgetFromJson(
                    serverAppBar.bottom as Map<String, dynamic>,
                    actionHandler: actionHandler,
                    valueHandler: valueHandler,
                  )
                  as PreferredSizeWidget?
            : null;
        return serverAppBar.toWidget(
          leadingWidget: leading,
          titleWidget: title,
          actionsWidgets: actions,
          flexibleSpaceWidget: flexibleSpace,
          bottomWidget: bottom,
        );

      case 'ServerDrawer':
        final serverDrawer = ServerDrawer.fromJson(json);
        final child = serverDrawer.child != null
            ? parseWidgetFromJson(
                serverDrawer.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverDrawer.toWidget(childWidget: child);

      case 'ServerFloatingActionButton':
        final serverFloatingActionButton = ServerFloatingActionButton.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );
        final child = serverFloatingActionButton.child != null
            ? parseWidgetFromJson(
                serverFloatingActionButton.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverFloatingActionButton.toWidget(
          childWidget: child,
          onPressedCallback: actionHandler?.getAction(
            json['onPressedActionId'] as String?,
          ),
        );

      case 'ServerElevatedButton':
        final serverElevatedButton = ServerElevatedButton.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );
        final child = serverElevatedButton.child != null
            ? parseWidgetFromJson(
                serverElevatedButton.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverElevatedButton.toWidget(
          childWidget: child,
          onPressedCallback: actionHandler?.getAction(
            json['onPressedActionId'] as String?,
          ),
        );

      case 'ServerIconButton':
        final serverIconButton = ServerIconButton.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );
        return serverIconButton.toWidget(
          onPressedCallback: actionHandler?.getAction(
            json['onPressedActionId'] as String?,
          ),
        );

      case 'ServerCard':
        final serverCard = ServerCard.fromJson(json);
        final child = serverCard.child != null
            ? parseWidgetFromJson(
                serverCard.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverCard.toWidget(childWidget: child);

      case 'ServerInkWell':
        final serverInkWell = ServerInkWell.fromJson(
          json,
          brightness: brightness,
          valueResolver: valueHandler?.onGetValue,
        );
        final child = serverInkWell.child != null
            ? parseWidgetFromJson(
                serverInkWell.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
                brightness: brightness,
              )
            : null;
        return serverInkWell.toWidget(childWidget: child);

      case 'ServerTransform':
        final serverTransform = ServerTransform.fromJson(json);
        final child = serverTransform.child != null
            ? parseWidgetFromJson(
                serverTransform.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverTransform.toWidget(childWidget: child);

      case 'ServerLoadingOverlay':
        final serverLoadingOverlay = ServerLoadingOverlay.fromJson(json);
        final child = serverLoadingOverlay.child != null
            ? parseWidgetFromJson(
                serverLoadingOverlay.child!,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverLoadingOverlay.toWidget(childWidget: child);

      case 'ServerLoadingShimmerCard':
        return ServerLoadingShimmerCard.fromJson(json).toWidget();

      case 'ServerRichText':
        return ServerRichText.fromJson(json).toWidget();

      case 'ServerVerticalDivider':
        return ServerVerticalDivider.fromJson(json).toWidget();

      case 'ServerClipPath':
        final serverClipPath = ServerClipPath.fromJson(json);
        final child = serverClipPath.child != null
            ? parseWidgetFromJson(
                serverClipPath.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverClipPath.toWidget(childWidget: child);

      case 'ServerScrollConfiguration':
        final serverScrollConfiguration = ServerScrollConfiguration.fromJson(
          json,
        );
        final child = serverScrollConfiguration.child != null
            ? parseWidgetFromJson(
                serverScrollConfiguration.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverScrollConfiguration.toWidget(childWidget: child);

      case 'ServerWillPopScope':
        final serverWillPopScope = ServerWillPopScope.fromJson(json);
        final child = serverWillPopScope.child != null
            ? parseWidgetFromJson(
                serverWillPopScope.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverWillPopScope.toWidget(
          childWidget: child,
          onWillPopCallback: () async {
            return serverWillPopScope.onWillPop;
          },
        );

      case 'ServerPlatform':
        final serverPlatform = ServerPlatform.fromJson(json);
        final child = serverPlatform.child != null
            ? parseWidgetFromJson(
                serverPlatform.child as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        final fallback = serverPlatform.fallback != null
            ? parseWidgetFromJson(
                serverPlatform.fallback as Map<String, dynamic>,
                actionHandler: actionHandler,
                valueHandler: valueHandler,
              )
            : null;
        return serverPlatform.toWidget(
          childWidget: child,
          fallbackWidget: fallback,
        );

      default:
        return const SizedBox.shrink();
    }
  }

  static Widget fromJson(
    Map<String, dynamic> json, {
    ServerActionHandler? actionHandler,
    ServerValueHandler? valueHandler,
    Brightness? brightness,
  }) {
    return parseWidgetFromJson(
      json,
      actionHandler: actionHandler,
      valueHandler: valueHandler,
      brightness: brightness,
    );
  }

  static Map<String, dynamic> regenerateJson(Map<String, dynamic> json) {
    final widgetType = json['widgetType'] as String? ?? json['type'];

    if (widgetType == null) {
      return json;
    }

    switch (widgetType) {
      case 'ServerText':
        return ServerText.fromJson(json).toJson();

      case 'ServerColumn':
        final serverColumn = ServerColumn.fromJson(json);
        final children = serverColumn.children != null
            ? serverColumn.children!
                  .map((item) => regenerateJson(item))
                  .toList()
            : <Map<String, dynamic>>[];
        final result = serverColumn.toJson();
        result['children'] = children;
        return result;

      case 'ServerRow':
        final serverRow = ServerRow.fromJson(json);
        final children = serverRow.children != null
            ? serverRow.children!.map((item) => regenerateJson(item)).toList()
            : <Map<String, dynamic>>[];
        final result = serverRow.toJson();
        result['children'] = children;
        return result;

      case 'ServerStack':
        final serverStack = ServerStack.fromJson(json);
        final children = serverStack.children
            .map((item) => regenerateJson(item))
            .toList();
        final result = serverStack.toJson();
        result['children'] = children;
        return result;

      case 'ServerSizedBox':
        final serverSizedBox = ServerSizedBox.fromJson(json);
        final child = serverSizedBox.child != null
            ? regenerateJson(serverSizedBox.child!)
            : null;
        final result = serverSizedBox.toJson();
        result['child'] = child;
        return result;

      case 'ServerSingleChildScrollView':
        final serverSingleChildScrollView =
            ServerSingleChildScrollView.fromJson(json);
        final child = serverSingleChildScrollView.child != null
            ? regenerateJson(
                serverSingleChildScrollView.child as Map<String, dynamic>,
              )
            : null;
        final result = serverSingleChildScrollView.toJson();
        result['child'] = child;
        return result;

      case 'ServerScaffold':
        final serverScaffold = ServerScaffold.fromJson(json);
        final appBar = serverScaffold.appBar != null
            ? regenerateJson(serverScaffold.appBar as Map<String, dynamic>)
            : null;
        final body = serverScaffold.body != null
            ? regenerateJson(serverScaffold.body as Map<String, dynamic>)
            : null;
        final floatingActionButton = serverScaffold.floatingActionButton != null
            ? regenerateJson(
                serverScaffold.floatingActionButton as Map<String, dynamic>,
              )
            : null;
        final persistentFooterButtons =
            serverScaffold.persistentFooterButtons != null
            ? (serverScaffold.persistentFooterButtons as List)
                  .map((item) => regenerateJson(item as Map<String, dynamic>))
                  .toList()
            : null;
        final drawer = serverScaffold.drawer != null
            ? regenerateJson(serverScaffold.drawer as Map<String, dynamic>)
            : null;
        final endDrawer = serverScaffold.endDrawer != null
            ? regenerateJson(serverScaffold.endDrawer as Map<String, dynamic>)
            : null;
        final bottomNavigationBar = serverScaffold.bottomNavigationBar != null
            ? regenerateJson(
                serverScaffold.bottomNavigationBar as Map<String, dynamic>,
              )
            : null;
        final result = serverScaffold.toJson();
        result['appBar'] = appBar;
        result['body'] = body;
        result['floatingActionButton'] = floatingActionButton;
        result['persistentFooterButtons'] = persistentFooterButtons;
        result['drawer'] = drawer;
        result['endDrawer'] = endDrawer;
        result['bottomNavigationBar'] = bottomNavigationBar;
        return result;

      case 'ServerCustomAppButton':
        return ServerCustomAppButton.fromJson(json).toJson();

      case 'ServerImage':
        return ServerImage.fromJson(json).toJson();

      case 'ServerImageAsset':
        return ServerImageAsset.fromJson(json).toJson();

      case 'ServerSvgAsset':
        return ServerSvgAsset.fromJson(json).toJson();

      case 'ServerExtendedCachedNetworkImage':
        final serverImage = ServerExtendedCachedNetworkImage.fromJson(json);
        final placeholderWidget = serverImage.placeholderWidget != null
            ? regenerateJson(serverImage.placeholderWidget!)
            : null;
        final result = serverImage.toJson();
        result['placeholderWidget'] = placeholderWidget;
        return result;

      case 'ServerClipRRect':
        final serverClipRRect = ServerClipRRect.fromJson(json);
        final child = serverClipRRect.child != null
            ? regenerateJson(serverClipRRect.child as Map<String, dynamic>)
            : null;
        final result = serverClipRRect.toJson();
        result['child'] = child;
        return result;

      case 'ServerGestureDetector':
        final serverGestureDetector = ServerGestureDetector.fromJson(json);
        final child = serverGestureDetector.child != null
            ? regenerateJson(
                serverGestureDetector.child as Map<String, dynamic>,
              )
            : null;
        final result = serverGestureDetector.toJson();
        result['child'] = child;
        return result;

      case 'ServerDecoratedBox':
        final serverDecoratedBox = ServerDecoratedBox.fromJson(json);
        final child = serverDecoratedBox.child != null
            ? regenerateJson(serverDecoratedBox.child as Map<String, dynamic>)
            : null;
        final result = serverDecoratedBox.toJson();
        result['child'] = child;
        return result;

      case 'ServerContainer':
        final serverContainer = ServerContainer.fromJson(json);
        final child = serverContainer.child != null
            ? regenerateJson(serverContainer.child as Map<String, dynamic>)
            : null;
        final result = serverContainer.toJson();
        result['child'] = child;
        return result;

      case 'ServerExpanded':
        final serverExpanded = ServerExpanded.fromJson(json);
        final child =
            serverExpanded.child != null &&
                serverExpanded.child is Map<String, dynamic>
            ? regenerateJson(serverExpanded.child as Map<String, dynamic>)
            : serverExpanded.child;
        final result = serverExpanded.toJson();
        result['child'] = child;
        return result;

      case 'ServerFlexible':
        final serverFlexible = ServerFlexible.fromJson(json);
        final child =
            serverFlexible.child != null &&
                serverFlexible.child is Map<String, dynamic>
            ? regenerateJson(serverFlexible.child as Map<String, dynamic>)
            : serverFlexible.child;
        final result = serverFlexible.toJson();
        result['child'] = child;
        return result;

      case 'ServerWrap':
        final serverWrap = ServerWrap.fromJson(json);
        final children = serverWrap.children != null
            ? serverWrap.children!.map((item) => regenerateJson(item)).toList()
            : <Map<String, dynamic>>[];
        final result = serverWrap.toJson();
        result['children'] = children;
        return result;

      case 'ServerAspectRatio':
        final serverAspectRatio = ServerAspectRatio.fromJson(json);
        final child = serverAspectRatio.child != null
            ? regenerateJson(serverAspectRatio.child as Map<String, dynamic>)
            : null;
        final result = serverAspectRatio.toJson();
        result['child'] = child;
        return result;

      case 'ServerPositioned':
        final serverPositioned = ServerPositioned.fromJson(json);
        final child = serverPositioned.child != null
            ? regenerateJson(serverPositioned.child as Map<String, dynamic>)
            : null;
        final result = serverPositioned.toJson();
        result['child'] = child;
        return result;

      case 'ServerOpacity':
        final serverOpacity = ServerOpacity.fromJson(json);
        final child = serverOpacity.child != null
            ? regenerateJson(serverOpacity.child as Map<String, dynamic>)
            : null;
        final result = serverOpacity.toJson();
        result['child'] = child;
        return result;

      case 'ServerVisibility':
        final serverVisibility = ServerVisibility.fromJson(json);
        final child = serverVisibility.child != null
            ? regenerateJson(serverVisibility.child as Map<String, dynamic>)
            : null;
        final result = serverVisibility.toJson();
        result['child'] = child;
        return result;

      case 'ServerSafeArea':
        final serverSafeArea = ServerSafeArea.fromJson(json);
        final child = serverSafeArea.child != null
            ? regenerateJson(serverSafeArea.child as Map<String, dynamic>)
            : null;
        final result = serverSafeArea.toJson();
        result['child'] = child;
        return result;

      case 'ServerDivider':
        return ServerDivider.fromJson(json).toJson();

      case 'ServerSpacer':
        return ServerSpacer.fromJson(json).toJson();

      case 'ServerIcon':
        return ServerIcon.fromJson(json).toJson();

      case 'ServerCard':
        final serverCard = ServerCard.fromJson(json);
        final child = serverCard.child != null
            ? regenerateJson(serverCard.child as Map<String, dynamic>)
            : null;
        final result = serverCard.toJson();
        result['child'] = child;
        return result;

      case 'ServerInkWell':
        final serverInkWell = ServerInkWell.fromJson(json);
        final child = serverInkWell.child != null
            ? regenerateJson(serverInkWell.child as Map<String, dynamic>)
            : null;
        final result = serverInkWell.toJson();
        result['child'] = child;
        return result;

      case 'ServerTransform':
        final serverTransform = ServerTransform.fromJson(json);
        final child = serverTransform.child != null
            ? regenerateJson(serverTransform.child as Map<String, dynamic>)
            : null;
        final result = serverTransform.toJson();
        result['child'] = child;
        return result;

      case 'ServerLoadingOverlay':
        final serverLoadingOverlay = ServerLoadingOverlay.fromJson(json);
        final child = serverLoadingOverlay.child != null
            ? regenerateJson(serverLoadingOverlay.child!)
            : null;
        final result = serverLoadingOverlay.toJson();
        result['child'] = child;
        return result;

      case 'ServerLoadingShimmerCard':
        return ServerLoadingShimmerCard.fromJson(json).toJson();

      case 'ServerRichText':
        return ServerRichText.fromJson(json).toJson();

      case 'ServerVerticalDivider':
        return ServerVerticalDivider.fromJson(json).toJson();

      case 'ServerClipPath':
        final serverClipPath = ServerClipPath.fromJson(json);
        final child = serverClipPath.child != null
            ? regenerateJson(serverClipPath.child as Map<String, dynamic>)
            : null;
        final result = serverClipPath.toJson();
        result['child'] = child;
        return result;

      case 'ServerScrollConfiguration':
        final serverScrollConfiguration = ServerScrollConfiguration.fromJson(
          json,
        );
        final child = serverScrollConfiguration.child != null
            ? regenerateJson(
                serverScrollConfiguration.child as Map<String, dynamic>,
              )
            : null;
        final result = serverScrollConfiguration.toJson();
        result['child'] = child;
        return result;

      case 'ServerWillPopScope':
        final serverWillPopScope = ServerWillPopScope.fromJson(json);
        final child = serverWillPopScope.child != null
            ? regenerateJson(serverWillPopScope.child as Map<String, dynamic>)
            : null;
        final result = serverWillPopScope.toJson();
        result['child'] = child;
        return result;

      case 'ServerPlatform':
        final serverPlatform = ServerPlatform.fromJson(json);
        final child = serverPlatform.child != null
            ? regenerateJson(serverPlatform.child as Map<String, dynamic>)
            : null;
        final fallback = serverPlatform.fallback != null
            ? regenerateJson(serverPlatform.fallback as Map<String, dynamic>)
            : null;
        final result = serverPlatform.toJson();
        result['child'] = child;
        result['fallback'] = fallback;
        return result;

      case 'ServerPadding':
        final serverPadding = ServerPadding.fromJson(json);
        final child =
            serverPadding.child != null &&
                serverPadding.child is Map<String, dynamic>
            ? regenerateJson(serverPadding.child as Map<String, dynamic>)
            : serverPadding.child;
        final result = serverPadding.toJson();
        result['child'] = child;
        return result;

      case 'ServerCenter':
        final serverCenter = ServerCenter.fromJson(json);
        final child =
            serverCenter.child != null &&
                serverCenter.child is Map<String, dynamic>
            ? regenerateJson(serverCenter.child as Map<String, dynamic>)
            : serverCenter.child;
        final result = serverCenter.toJson();
        result['child'] = child;
        return result;

      case 'ServerAlign':
        final serverAlign = ServerAlign.fromJson(json);
        final child =
            serverAlign.child != null &&
                serverAlign.child is Map<String, dynamic>
            ? regenerateJson(serverAlign.child as Map<String, dynamic>)
            : serverAlign.child;
        final result = serverAlign.toJson();
        result['child'] = child;
        return result;

      case 'ServerSpace':
        return ServerSpace.fromJson(json).toJson();

      default:
        return json;
    }
  }
}
