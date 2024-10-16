import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return _CenterWidget(text: text);
  }
}

class _CenterWidget extends StatelessWidget {
  const _CenterWidget({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
