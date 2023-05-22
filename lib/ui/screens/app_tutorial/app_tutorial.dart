import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final List<SlideInfo> slides = [
  SlideInfo(
    title: 'Busca la comida',
    caption:
        'Irure laboris Lorem cillum in sunt. Sint quis nostrud nostrud anim.',
    imageUrl: 'assets/Images/1.png',
  ),
  SlideInfo(
    title: 'Rápida entrega',
    caption:
        'Voluptate pariatur consequat reprehenderit esse ea cupidatat minim ipsum esse esse consectetur.',
    imageUrl: 'assets/Images/2.png',
  ),
  SlideInfo(
    title: 'Distruta de tu comida',
    caption:
        'Exercitation ad adipisicing cillum cupidatat in officia adipisicing quis sint proident.',
    imageUrl: 'assets/Images/3.png',
  )
];

class AppTurorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';
  const AppTurorialScreen({super.key});

  @override
  State<AppTurorialScreen> createState() => _AppTurorialScreenState();
}

class _AppTurorialScreenState extends State<AppTurorialScreen> {
  final PageController pageViewController = PageController();
  bool isFinalPage = false;
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(
      () {
        final page = pageViewController.page ?? 0;
        if (!isFinalPage && page >= (slides.length - 1.5)) {
          setState(() {
            isFinalPage = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            top: 50,
            right: 15,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          isFinalPage
              ? Positioned(
                  bottom: 20,
                  right: 15,
                  child: FadeInRight(
                    duration: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    Key? key,
    required this.title,
    required this.caption,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
