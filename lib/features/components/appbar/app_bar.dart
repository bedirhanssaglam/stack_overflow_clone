import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget title;

  CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FadeInDown(
        child: widget.title,
      ),
    );
  }
}
