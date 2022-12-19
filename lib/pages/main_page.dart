import 'package:flutter/material.dart';
import 'package:project_db/components/custom_drawer.dart';

import '../components/Custom_carousel.dart';
import '../components/custom_sliver_grid_view.dart';
import '../components/footer.dart';
import '../components/search_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    _controller.text = '1';
    SliverGridDelegate gridDelegate =
        const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
    );
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: SearchAppbar(context, _controller),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: CarouselWithIndicatorDemo(),
            ),
          ),
          CustomSliverGridView(gridDelegate: gridDelegate),
          Footer(),
        ],
      ),
    );
  }
}
