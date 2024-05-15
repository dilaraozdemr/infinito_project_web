import 'package:flutter/material.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;
  final Function(bool) onHover;

  HoverContainer({
    required this.child,
    required this.onHover,
  });

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
          widget.onHover(_isHovered);
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
          widget.onHover(_isHovered);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!_isHovered)
              Positioned.fill(
                child: ClipRect(
                  child: OverflowBox(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            if (_isHovered)
              Transform.scale(
                scale: 1.1,
                child: widget.child,
              ),
          ],
        ),
      ),
    );
  }
}