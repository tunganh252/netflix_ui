import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({Key key, @required this.title, @required this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () => print("preview"),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(content.imageUrl)),
                          shape: BoxShape.circle,
                          border: Border.all(width: 4.0, color: content.color),
                        ),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 60.0,
                            child: Image.asset(content.titleImageUrl),
                          ))
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
