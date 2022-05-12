import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  final Function? onRetryFunction;
  const NoInternetConnection({
    required this.onRetryFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 200,
            height: 250,
            child: Image(
              image: AssetImage("assets/images/internet.png"),
            ),
          ),
          const SizedBox(height: 20),
          onRetryFunction == null
              ? const SizedBox()
              : ElevatedButton(
                  onPressed: () => onRetryFunction!(),
                  child: const Text('Retry'),
                ),
        ],
      ),
    );
  }
}
