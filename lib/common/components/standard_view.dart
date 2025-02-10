import 'package:flutter/material.dart';
import 'package:spallawebapp/common/components/standard_app_bar.dart';
import 'package:spallawebapp/common/style/app_colors.dart';

class StandardView extends StatefulWidget {
  final String title;
  final Widget child;

  const StandardView({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  State<StandardView> createState() => _StandardViewState();
}

class _StandardViewState extends State<StandardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: StandardAppBar(title: widget.title),
      body: widget.child,
    );
  }
}
