import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';
import 'package:flutter_netflix_responsive_ui/widgets/vertical_icon_button.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featureContent;

  const ContentHeader({
    Key key,
    @required this.featureContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentMobile(featureContent: featureContent),
      desktop: _ContentDesktop(featureContent: featureContent),
    );
  }
}

class _ContentMobile extends StatelessWidget {
  final Content featureContent;

  const _ContentMobile({
    Key key,
    this.featureContent,
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

class _ContentDesktop extends StatefulWidget {
  final Content featureContent;

  const _ContentDesktop({
    Key key,
    this.featureContent,
  }) : super(key: key);

  @override
  State<_ContentDesktop> createState() => _ContentDesktopState();
}

class _ContentDesktopState extends State<_ContentDesktop> {
  VideoPlayerController _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featureContent.videoUrl)
          ..initialize().then((_) => setState(() => {}))..setVolume(0)..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                widget.featureContent.imageUrl,
            fit: BoxFit.cover,
            ),
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
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featureContent.titleImageUrl),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.featureContent.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 4.0),
                          blurRadius: 6.0,
                        )
                      ]),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(
                      width: 16.0,
                    ),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      onPressed: () => print("More Info"),
                      label: const Text("More Info"),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    if (_videoController.value.isInitialized)
                      IconButton(
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          _isMuted
                              ? _videoController.setVolume(100)
                              : _videoController.setVolume(0);
                          _isMuted = _videoController.value.volume == 0;
                        }),
                        icon:
                            Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
            backgroundColor: Colors.white),
        icon: const Icon(Icons.play_arrow, size: 30.0),
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ));
  }
}
