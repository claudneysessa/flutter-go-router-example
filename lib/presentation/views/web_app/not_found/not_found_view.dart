import 'package:flutter/material.dart';
import 'package:spallawebapp/common/components/standard_view.dart';
import 'package:spallawebapp/presentation/views/web_app/not_found/not_found_controller.dart';

class PageNotFoundView extends StatefulWidget {
  const PageNotFoundView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<PageNotFoundView> createState() => _PageNotFoundViewState();
}

class _PageNotFoundViewState extends State<PageNotFoundView> {
  final controller = PageNotFoundController();

  @override
  Widget build(BuildContext context) {
    return StandardView(
      title: 'Page Not Found',
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.isLoading,
        builder: (context, isLoading, child) {
          return Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    'Page Not Found',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
