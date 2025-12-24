import 'package:flutter/material.dart';

class BouncingDot extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  const BouncingDot({
    super.key,
    this.color = Colors.white,
    this.size = 10,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<BouncingDot> createState() => _BouncingDotState();
}

class _BouncingDotState extends State<BouncingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration * 3,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBot(int index) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: Interval((index / 3), (index + 1) / 3, curve: Curves.easeInOut),
      ),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, _buildBot)
          .map(
            (dot) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: dot,
            ),
          )
          .toList(),
    );
  }
}
