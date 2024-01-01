import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Hero Animation I"),
        ),
        body: Center(
          child: HeroTransitionImage(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        title: const Text("Hero Animation II"),
                      ),
                      body: Container(
                        alignment: Alignment.bottomCenter,
                        child: HeroTransitionImage(
                            onTap: () => Navigator.of(context).pop(),
                            imageUrl: "https://picsum.photos/200/300"),
                      ),
                    ))),
            imageUrl: "https://picsum.photos/200/300",
          ),
        ));
  }
}

class HeroTransitionImage extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  const HeroTransitionImage({
    super.key,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Hero(
        tag: "image",
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onTap,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ))),
      ),
    );
  }
}
