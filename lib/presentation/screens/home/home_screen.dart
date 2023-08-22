import 'package:flutter/material.dart';
import 'package:travel_ui_flutter/presentation/views/views.dart';
import 'package:travel_ui_flutter/presentation/widgets/custom_navigation_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  void _handlePressed(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  final List<Widget> viewRoutes = const [
    HomeView(),
    // TabbarSliverAppbar(),
    // AdvancedSliverAppbar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavigationBottomBar(
        pageIndex: _pageIndex,
        onPressed: _handlePressed,
      ),
    );
  }
}
