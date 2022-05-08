import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values.dart';

abstract class Page extends StatefulWidget {
  Page({Key? key}) : super(key: key);

  @protected
  Widget buildBody(BuildContext context);

  void initState() {}

  void dispose() {}

  PageHeaders _pageHeaders = PageHeaders();
  PageHeaders get pageHeaders => _pageHeaders;

  void setPageHeaders(PageHeaders pageHeaders) {
    _pageHeaders = pageHeaders;
  }

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  initState() {
    super.initState();
    widget.initState();
    // widget.setPageHeaders(PageHeaders());
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: UIThemeColors.bg,
        body: SizedBox.expand(child: widget.buildBody(context)),
      ),
    );
  }
}

class PageHeaders {
  String? title;
  bool? participatesInRootNavigator;
  double Function(BuildContext)? gestureWidth;
  bool maintainState;
  Curve curve;
  Alignment? alignment;
  Map<String, String>? parameters;
  bool opaque;
  Duration? transitionDuration;
  bool? popGesture;
  Bindings? binding;
  List<Bindings> bindings = const [];
  Transition? transition;
  CustomTransition? customTransition;
  bool fullscreenDialog;
  bool showCupertinoParallax;
  bool preventDuplicates;

  PageHeaders({
    this.title,
    this.participatesInRootNavigator,
    this.gestureWidth,
    this.maintainState = true,
    this.curve = Curves.linear,
    this.alignment,
    this.parameters,
    this.opaque = true,
    this.transitionDuration,
    this.popGesture,
    this.binding,
    this.transition,
    this.customTransition,
    this.fullscreenDialog = false,
    this.showCupertinoParallax = true,
    this.preventDuplicates = true,
  });
}
