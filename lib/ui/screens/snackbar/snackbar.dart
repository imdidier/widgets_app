import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    SnackBar snackBar = SnackBar(
      content: const Text('Soy un Snackbar'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('¿Estás seguro?'),
          content: const Text(
            'Culpa qui proident dolor tempor. Tempor duis enim esse culpa aliqua esse culpa labore. Esse voluptate cillum adipisicing veniam in enim non commodo tempor cillum minim. Laboris irure do et aliquip laboris. Ea consequat consectetur qui in pariatur enim nulla ad laboris non laboris. Minim aliquip cillum magna elit.Mollit incididunt labore reprehenderit tempor quis non qui est pariatur reprehenderit sit dolore consectetur anim. Est commodo eiusmod mollit deserunt velit officia irure do id aliquip. Nisi est irure consectetur est ipsum veniam esse veniam commodo ea ullamco magna consequat aute. Elit eu consectetur in excepteur deserunt incididunt consequat occaecat minim amet officia laborum amet. Veniam aliqua anim ut elit occaecat sunt mollit sit nulla proident id. Sunt proident irure duis tempor qui consectetur irure est cupidatat aute Lorem eiusmod ut nostrud.',
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('NO'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('SÍ'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanckbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                    'Culpa qui proident dolor tempor. Tempor duis enim esse culpa aliqua esse culpa labore. Esse voluptate cillum adipisicing veniam in enim non commodo tempor cillum minim. Laboris irure do et aliquip laboris. Ea consequat consectetur qui in pariatur enim nulla ad laboris non laboris. Minim aliquip cillum magna elit.Mollit incididunt labore reprehenderit tempor quis non qui est pariatur reprehenderit sit dolore consectetur anim. Est commodo eiusmod mollit deserunt velit officia irure do id aliquip. Nisi est irure consectetur est ipsum veniam esse veniam commodo ea ullamco magna consequat aute. Elit eu consectetur in excepteur deserunt incididunt consequat occaecat minim amet officia laborum amet. Veniam aliqua anim ut elit occaecat sunt mollit sit nulla proident id. Sunt proident irure duis tempor qui consectetur irure est cupidatat aute Lorem eiusmod ut nostrud.',
                  )
                ]);
              },
              child: const Text('Licencias que se usan en el proyecto'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye),
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
