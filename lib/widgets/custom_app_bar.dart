import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black
          .withOpacity((((scrollOffset / 350).clamp(0, 1).toDouble()))),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                      onTap: () => print("TV Shows"), title: "TV Shows"),
                  _AppBarButton(onTap: () => print("Movies"), title: "Movies"),
                  _AppBarButton(
                      onTap: () => print("My List"), title: "My List"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key key, @required this.title, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5),
      ),
    );
  }
}
