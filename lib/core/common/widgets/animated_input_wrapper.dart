import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

class AnimatedInputWrapper extends StatefulWidget {
  final Widget child;
  final bool hasError;
  final bool isActive;

  const AnimatedInputWrapper({
    super.key,
    required this.child,
    this.hasError = false,
    this.isActive = false,
  });

  @override
  State<AnimatedInputWrapper> createState() => _AnimatedInputWrapperState();
}

class _AnimatedInputWrapperState extends State<AnimatedInputWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
  }

  @override
  void didUpdateWidget(AnimatedInputWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasError && !oldWidget.hasError) {
      _shakeController.forward().then((_) => _shakeController.reverse());
    }
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value * (widget.hasError ? 1 : 0), 0), // Simple shake
          child: child,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(widget.isActive ? 1.01 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // We don't apply border/color here as child TextField usually handles it,
          // but we apply the scale effect. 
          // If we needed a glow, we would wrap with a Container having a BoxShadow.
           boxShadow: widget.isActive ? [
             BoxShadow(
               color: AppColors.primary.withOpacity(0.1),
               blurRadius: 12,
               spreadRadius: 2,
             )
           ] : [],
        ),
        child: widget.child, 
      ),
    );
  }
}
