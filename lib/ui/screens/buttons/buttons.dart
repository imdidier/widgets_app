import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Button disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Elevated button icon'),
              icon: const Icon(Icons.architecture),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled button'),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_balance),
              label: const Text('Filled button icon'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutLined button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('OutLine button icon'),
              icon: const Icon(Icons.youtube_searched_for_sharp),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.work_outline_sharp),
              label: const Text('Text Button icon'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.wifi_password_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.wifi_password_outlined),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
              ),
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Text('custom button'),
          ),
        ),
      ),
    );
  }
}
