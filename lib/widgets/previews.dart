import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({
    Key key,
    this.title,
    this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];

              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color, width: 4.0),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
