import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/widgets/content_header.dart';
import 'package:flutter_netflix_responsive_ui/widgets/content_list.dart';
import 'package:flutter_netflix_responsive_ui/widgets/custom_app_bar.dart';
import 'package:flutter_netflix_responsive_ui/widgets/previews.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffSet = 0.0;


  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffSet = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(scrollOffSet: _scrollOffSet),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(
                featureContent: sintelContent
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(title: "Previews", contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: "My List",
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: "NetFlix Originals",
              contentList: myList,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                title: "Trending",
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print("Cast"),
      ),
    );
  }
}
