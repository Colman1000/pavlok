import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key? key,
    this.shadow = const BoxShadow(
      blurRadius: 10,
      color: Colors.black38,
      offset: Offset(0, 0),
    ),
    Widget? child,
  }) : super(key: key, child: child);
  final BoxShadow shadow;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);

    return renderObject;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderInnerShadow renderObject,
  ) =>
      renderObject._shadow = shadow;
}

class _RenderInnerShadow extends RenderProxyBox {
  Shadow? _shadow;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    if (_shadow == null) return;
    final shadow = _shadow!;

    final Rect bounds = offset & size;

    final Canvas canvas = context.canvas..saveLayer(bounds, Paint());
    context.paintChild(child!, offset);

    final Rect shadowRect = bounds.inflate(shadow.blurRadius);
    final shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..colorFilter = ColorFilter.mode(shadow.color, BlendMode.srcOut)
      ..imageFilter =
          ImageFilter.blur(sigmaX: shadow.blurSigma, sigmaY: shadow.blurSigma);
    canvas
      ..saveLayer(shadowRect, shadowPaint)
      ..translate(shadow.offset.dx, shadow.offset.dy);
    context.paintChild(child!, offset);
    canvas
      ..restore()
      ..restore();
  }
}
