import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {
  // 1

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExploreScreenState();
  }
}

class ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _scrollController;

  void _scrollListner() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('reached the bottom!');
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('reached the top!');
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListner);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO: Add Nested List Views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          return ListView(
            // 6
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            children: [
              // 7
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              // 8
              const SizedBox(height: 16),
              // 9
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListner);
    _scrollController.dispose();
    super.dispose();
  }
}
