import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:myntra_clone/components%20/appbar.dart';
import 'package:myntra_clone/components%20/bottom_app_bar.dart';
import 'package:myntra_clone/screens/all_category_screen.dart';

class HomeScreen extends StatefulWidget {
  final Widget? childScreen;
  const HomeScreen({super.key, this.childScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        color: GSTheme.of(context).background0,
      ),
      // backgroundColor: GSTheme.of(context).background0,

      child: GSStack(
        children: [
          GSScrollView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: widget.childScreen ?? AllCategoryScreen(),
            ),
          ]),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GSBox(
              style: GSStyle(
                lg: GSStyle(isVisible: false),
                height: 85,
              ),
              child: GSBox(
                style: GSStyle(
                  bg: GSTheme.of(context).white,
                  dark: GSStyle(bg: const Color(0xFF171717)),
                  padding: EdgeInsets.only(
                      left: getResponsiveValue(
                            context: context,
                            xsValue: 6,
                            smValue: 12,
                          ) ??
                          4,
                      right: getResponsiveValue(
                            context: context,
                            xsValue: 6,
                            smValue: 12,
                          ) ??
                          4,
                      top: 20,
                      bottom: 10),
                ),
                child: GSHStack(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomBarTile(
                      icon: Icons.person_2_outlined,
                      title: 'Profile',
                    ),
                    BottomBarTile(
                      icon: Icons.favorite_border,
                      title: 'Wishlist',
                    ),
                    BottomBarTile(
                      icon: Icons.shopping_bag_outlined,
                      title: 'Bag',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
