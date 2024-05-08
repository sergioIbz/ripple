import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RippleWidget extends StatefulWidget {
  final Widget child;
  const RippleWidget({
    required this.child,
    super.key,
  });

  @override
  State<RippleWidget> createState() => _RippleWidgetState();
}

class _RippleWidgetState extends State<RippleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation_1;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );

    animation_1 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      controller,
    );

    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: 1 - animation_1.value,
          child: Transform.scale(
            scale: 1 + (0.8 * animation_1.value),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class Ripple extends StatelessWidget {
  final Widget widget;
  const Ripple({
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...generarListaDeWidgets(
          RippleWidget(
            child: widget,
          ),
        ),
        widget
      ],
    );
  }
}

List<Widget> generarListaDeWidgets(Widget widget) {
  List<Widget> widgets = [];

  for (int i = 0; i < 2; i++) {
    widgets.add(
      FutureBuilder(
        future: Future.delayed(Duration(milliseconds: i * 1500)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          } else {
            return widget;
          }
        },
      ),
    );
  }

  return widgets;
}
