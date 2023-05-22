import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Text('Progress Indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(
            backgroundColor: Colors.black38,
            strokeWidth: 3,
          ),
          SizedBox(height: 20),
          Text('Progress Indicator circular y linear'),
          SizedBox(height: 10),
          _ControlledProgresIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value <= 100),
      builder: (context, snapshot) {
        final double progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.black38,
                strokeWidth: 3,
                value: progressValue,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
