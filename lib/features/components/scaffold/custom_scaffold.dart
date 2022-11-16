import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/features/components/appbar/app_bar.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.isThereAppBar = true,
  });

  final Widget title;
  final Widget body;
  final bool? isThereAppBar;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isThereAppBar!
          ? CustomAppBar(
              title: widget.title,
            )
          : null,
      body: widget.body,
    );
  }
}
