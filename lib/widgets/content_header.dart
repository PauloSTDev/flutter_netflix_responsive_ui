import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/widgets/vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featureContent;

  const ContentHeader({
    Key key,
    @required this.featureContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(featureContent.imageUrl),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featureContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add,
                  title: "List",
                  onTap: () => print("list"),
              ),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "Info",
                  onTap: () => print("Info"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => print('Play'),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          primary: Colors.black,
          backgroundColor: Colors.white
        ),
      icon: const Icon(Icons.play_arrow, size: 30.0),
      label: const Text("Play", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),)
    );
  }
}
