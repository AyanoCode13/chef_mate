
import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double borderRadius;
  final Duration animationDuration;

  const AnimatedSearchBar({
    Key? key,
    this.hintText = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.borderRadius = 25.0,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fadeController;
  late Animation<double> _widthAnimation;
  late Animation<double> _fadeAnimation;
  late TextEditingController _textController;
  late FocusNode _focusNode;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    
    _fadeController = AnimationController(
      duration: Duration(milliseconds: widget.animationDuration.inMilliseconds ~/ 2),
      vsync: this,
    );

    _widthAnimation = Tween<double>(
      begin: 50.0,
      end: 300.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    _textController = TextEditingController();
    _focusNode = FocusNode();

    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && !_isExpanded) {
      _expandSearchBar();
    } else if (!_focusNode.hasFocus && _isExpanded && _textController.text.isEmpty) {
      _collapseSearchBar();
    }
  }

  void _expandSearchBar() {
    setState(() {
      _isExpanded = true;
    });
    _animationController.forward();
    Future.delayed(Duration(milliseconds: widget.animationDuration.inMilliseconds ~/ 3), () {
      _fadeController.forward();
    });
  }

  void _collapseSearchBar() {
    _fadeController.reverse();
    Future.delayed(Duration(milliseconds: widget.animationDuration.inMilliseconds ~/ 3), () {
      _animationController.reverse();
      setState(() {
        _isExpanded = false;
      });
    });
  }

  void _toggleSearchBar() {
    if (_isExpanded) {
      if (_textController.text.isEmpty) {
        _focusNode.unfocus();
        _collapseSearchBar();
      } else {
        _textController.clear();
        widget.onChanged?.call('');
      }
    } else {
      _expandSearchBar();
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = widget.backgroundColor ?? theme.cardColor;
    final iconColor = widget.iconColor ?? theme.iconTheme.color;
    final textColor = widget.textColor ?? theme.textTheme.bodyLarge?.color;

    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) {
        return Container(
          width: _widthAnimation.value,
          height: 50.0,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: _toggleSearchBar,
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      _isExpanded && _textController.text.isNotEmpty
                          ? Icons.clear
                          : Icons.search,
                      key: ValueKey(_isExpanded && _textController.text.isNotEmpty),
                      color: iconColor,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              if (_widthAnimation.value > 60)
                Expanded(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      style: TextStyle(color: textColor),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {}); // Rebuild to update clear icon
                        widget.onChanged?.call(value);
                      },
                      onSubmitted: widget.onSubmitted,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}