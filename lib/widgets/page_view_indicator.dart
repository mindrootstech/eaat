import 'package:eaat/core/constants/color_palette.dart';
import 'package:flutter/material.dart';

class PageViewIndicator extends StatefulWidget {
  final PageController pageController;
  final int size;

  const PageViewIndicator({
    super.key,
    required this.pageController,
    required this.size,
  });

  @override
  State<PageViewIndicator> createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(_pageListener);
  }

  void _pageListener() {
    final newPage = widget.pageController.page?.round() ?? 0;
    if (newPage != currentPage) {
      setState(() {
        currentPage = newPage;
      });
    }
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPageViewIndicator();
  }

  Widget _buildPageViewIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.size, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(4),
          height: 6,
          width: index == currentPage ? 20 : 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.5),
            color: index <= currentPage
                ? ColorPalette.primary
                : ColorPalette.lightGrey,
          ),
        );
      }),
    );
  }
}
