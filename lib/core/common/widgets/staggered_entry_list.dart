import 'package:flutter/material.dart';

class StaggeredEntryList extends StatefulWidget {
  final List<Widget> children;
  final double verticalOffset;
  final Duration duration;
  final Duration delay;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const StaggeredEntryList({
    super.key,
    required this.children,
    this.verticalOffset = 20.0,
    this.duration = const Duration(milliseconds: 400),
    this.delay = const Duration(milliseconds: 50),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  State<StaggeredEntryList> createState() => _StaggeredEntryListState();
}

class _StaggeredEntryListState extends State<StaggeredEntryList> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration + (widget.delay * (widget.children.length - 1)),
    );

    _fadeAnimations = [];
    _slideAnimations = [];

    // Calculate proportional interval for each child
    final totalDurationMs = _controller.duration!.inMilliseconds;
    final itemDurationMs = widget.duration.inMilliseconds;

    for (int i = 0; i < widget.children.length; i++) {
        final startTimeMs = widget.delay.inMilliseconds * i;
        final start = startTimeMs / totalDurationMs;
        final end = (startTimeMs + itemDurationMs) / totalDurationMs;

        final curve = CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end > 1.0 ? 1.0 : end, curve: Curves.easeOutCubic),
        );

        _fadeAnimations.add(Tween<double>(begin: 0.0, end: 1.0).animate(curve));
        _slideAnimations.add(Tween<Offset>(begin: Offset(0, widget.verticalOffset), end: Offset.zero).animate(curve));
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisAlignment: widget.mainAxisAlignment,
      children: List.generate(widget.children.length, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: _slideAnimations[index].value,
              child: Opacity(
                opacity: _fadeAnimations[index].value,
                child: child,
              ),
            );
          },
          child: widget.children[index],
        );
      }),
    );
  }
}
