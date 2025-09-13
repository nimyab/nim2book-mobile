import 'package:flutter/material.dart';

class CircularProgressWithPercentage extends StatefulWidget {
  final double progress;
  final Duration animationDuration;

  const CircularProgressWithPercentage({
    super.key,
    required this.progress,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  State<CircularProgressWithPercentage> createState() =>
      _CircularProgressWithPercentageState();
}

class _CircularProgressWithPercentageState
    extends State<CircularProgressWithPercentage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<double> _percentageAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.progress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _percentageAnimation = Tween<double>(
      begin: 0.0,
      end: widget.progress * 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CircularProgressWithPercentage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progress != widget.progress) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: widget.progress,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _percentageAnimation = Tween<double>(
        begin: _percentageAnimation.value,
        end: widget.progress * 100,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: _progressAnimation.value),
              Text(
                '${_percentageAnimation.value.toStringAsFixed(0)}%',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
