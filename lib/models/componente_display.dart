import 'package:flutter/material.dart';

import 'led_display.dart';

class ComponenteDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Container(
        width: 0.25*MediaQuery.of(context).size.width,
        height: 0.15*MediaQuery.of(context).size.height,
        color: Colors.yellow,
        child: CustomPaint(
          painter: ShapePainter(),
        ),
      ),
    );
  }
}
