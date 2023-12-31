import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/global_variables.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTap(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            "assets/images/ic_instagram.svg",
            color: primaryColor,
            height: 32,
          ),
          actions: [
            IconButton(
              onPressed: () => navigationTap(0),
              icon: const Icon(Icons.home),
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            IconButton(
              onPressed: () => navigationTap(1),
              icon: const Icon(Icons.search),
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            IconButton(
              onPressed: () => navigationTap(2),
              icon: const Icon(Icons.add_a_photo),
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            IconButton(
              onPressed: () => navigationTap(3),
              icon: const Icon(Icons.favorite),
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            IconButton(
              onPressed: () => navigationTap(4),
              icon: const Icon(Icons.person),
              color: _page == 4 ? primaryColor : secondaryColor,
            ),
          ],
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: homeScreenItems,
        ));
  }
}
