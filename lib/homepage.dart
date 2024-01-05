import 'package:cursor_animations/animated_pointer.dart';
import 'package:cursor_animations/text_column.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Offset? pointerOffset;

  late AnimationController pointerSizeController;

  late Animation<double> pointerAnimation;

  @override
  void initState() {
    pointerOffset = const Offset(0, 0);
    pointerSizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    pointerAnimation = CurvedAnimation(
        curve: Curves.easeInOutCubic,
        parent: Tween<double>(begin: 0, end: 1).animate(pointerSizeController));
    super.initState();
  }

  void togglePointerSize(bool hovering) async {
    if (hovering) {
      pointerSizeController.forward();
    } else {
      pointerSizeController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          setState(() {
            pointerOffset = event.localPosition;
          });
        },
        onExit: (event) {
          setState(() {
            pointerOffset = null;
          });
        },
        child: Stack(
          children: [
            Expanded(
              child: TextColumn(
                backgroundColor: Colors.black,
                textColor: Colors.white,
                onLinkHovered: togglePointerSize,
              ),
            ),
            if (pointerOffset != null) ...[
              AnimatedBuilder(
                animation: pointerSizeController,
                builder: (context, child) {
                  return AnimatedPointer(
                    pointerOffset: pointerOffset!,
                    radius: 45 + 100 * pointerAnimation.value,
                  );
                },
              ),
              AnimatedPointer(
                pointerOffset: pointerOffset!,
                movementDuration: const Duration(milliseconds: 200),
                radius: 10,
              )
            ]
          ],
        ),
      ),
    );
  }
}
