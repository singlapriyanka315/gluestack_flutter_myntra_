import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? hoveredMenu;
  bool isDropdownVisible = false;
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GSBox(
          boxShadow: [
            BoxShadow(
              color: GSTheme.of(context).black!.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
          style: GSStyle(
            height: 80,
            color: GSTheme.of(context).background0,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getResponsiveValue(
                      context: context,
                      xsValue: 2,
                      smValue: 8,
                      mdValue: 15,
                      lgValue: 22,
                      xlValue: 26,
                    ) ??
                    0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(getResponsiveValue(
                        context: context,
                        xsValue: 15,
                        smValue: 15,
                        mdValue: 18,
                        lgValue: 20,
                        xlValue: 22,
                      ) ??
                      0),
                  child: GSImage(
                    size: GSImageSizes.$xs,
                    path: 'assets/images/myntra_logo.png',
                    imageType: GSImageType.asset,
                  ),
                ),

                GSBox(
                  style: GSStyle(
                    lg: GSStyle(isVisible: true),
                    md: GSStyle(isVisible: true),
                    xs: GSStyle(isVisible: false),
                    sm: GSStyle(isVisible: false),
                  ),
                  child: Row(
                    children: [
                      _buildNavItem("Men"),
                      SizedBox(width: 20),
                      _buildNavItem("Women"),
                      SizedBox(width: 20),
                      _buildNavItem("Kids"),
                      SizedBox(width: 20),
                      _buildNavItem("Home & Living"),
                      SizedBox(width: 20),
                      _buildNavItem("Beauty"),
                      SizedBox(width: 20),
                      _buildNavItem("Studio"),
                    ],
                  ),
                ),

                // search input

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: getResponsiveValue(
                                context: context,
                                xsValue: 5,
                                smValue: 30,
                                mdValue: 50) ??
                            50,
                        right: getResponsiveValue(
                                context: context,
                                xsValue: 5,
                                smValue: 10,
                                mdValue: 20,
                                lgValue: 25) ??
                            30),
                    child: GSInput(
                      cursorWidth: 1,
                      cursorColor: GSTheme.of(context).trueGray500,
                      hintText: 'Search for products',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          overflow: TextOverflow.ellipsis,
                          color: GSTheme.of(context).trueGray500),
                      prefixIcon: Icon(Icons.search,
                          color: GSTheme.of(context).trueGray400),
                      style: GSStyle(
                          lg: GSStyle(isVisible: true),
                          md: GSStyle(isVisible: true),
                          xs: GSStyle(isVisible: true),
                          sm: GSStyle(isVisible: true),

                          // bg: GSTheme.of(context).black,
                          onFocus: GSStyle(
                            borderColor: GSTheme.of(context).trueGray200,
                            bg: GSTheme.of(context).black,
                          ),
                          borderColor:
                              const Color.fromARGB(255, 128, 124, 124)),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getResponsiveValue(
                              context: context,
                              xsValue: 0,
                              smValue: 0,
                              mdValue: 0,
                              lgValue: 24) ??
                          0),
                  child: GSBox(
                    style: GSStyle(
                      lg: GSStyle(isVisible: true),
                      md: GSStyle(isVisible: false),
                      xs: GSStyle(isVisible: false),
                      sm: GSStyle(isVisible: false),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildProfileNav(
                            text: "Profile",
                            onPressed: () {},
                            icon: Icons.person_2_outlined,
                            showBottomBar: true),
                        _buildProfileNav(
                            text: "Wishlist",
                            onPressed: () {},
                            icon: Icons.favorite_border,
                            showBottomBar: false),
                        _buildProfileNav(
                            text: "Bag",
                            onPressed: () {},
                            icon: Icons.shopping_bag_outlined,
                            showBottomBar: false)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          child: GSBox(
            style: GSStyle(width: MediaQuery.of(context).size.width),
            child: Visibility(
                visible: isDropdownVisible && hoveredMenu != null,
                child: hoveredMenu == "Men"
                    ? MenDropdown()
                    : hoveredMenu == "Women"
                        ? WomenDropdown()
                        : MenDropdown()),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          hoveredMenu = text;
          isDropdownVisible = true;
        });
      },
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            hoveredMenu = text;
            isDropdownVisible = true;
          });
        },
        onExit: (event) {
          Future.delayed(Duration(milliseconds: 100), () {
            if (!isDropdownVisible) {
              setState(() {
                hoveredMenu = null;
              });
            }
          });
        },
        child: GSBox(
          child: Column(
            children: [
              Expanded(
                child: GSBox(
                  child: GSButton(
                    size: GSButtonSizes.$lg,
                    onHover: () {},
                    variant: GSButtonVariants.link,
                    onPressed: () {},
                    child: GSText(
                      size: GSSizes.$sm,
                      text: text.toUpperCase(),
                      style: GSStyle(
                          textStyle: TextStyle(fontWeight: FontWeight.w600),
                          color: GSTheme.of(context).black),
                    ),
                  ),
                ),
              ),
              GSBox(
                style: GSStyle(
                  color: ((isDropdownVisible && hoveredMenu == text))
                      ? const Color.fromARGB(255, 255, 59, 59)
                      : Color.fromARGB(0, 0, 0, 0),
                  height: 3,
                ),
                child: GSText(
                  size: GSSizes.$sm,
                  text: text.toUpperCase(),
                  style: GSStyle(
                    color: Color.fromARGB(0, 0, 0, 0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileNav({
    required String text,
    Function()? onPressed,
    required IconData icon,
    required bool showBottomBar,
  }) {
    return GSFocusableActionDetector(
      child: Builder(
        builder: (context) {
          final isHovered =
              GSFocusableActionDetectorProvider.isHovered(context);

          return GSBox(
            child: Column(
              children: [
                Expanded(
                  child: GSBox(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GSIconButton(
                          icon: GSIcon(
                            icon: icon,
                            size: GSIconSizes.$xl,
                          ),
                          style: GSStyle(
                            padding: EdgeInsets.all(0),
                            bg: const Color.fromARGB(0, 0, 0, 0),
                          ),
                          size: GSIconButtonSizes.$xs,
                          onPressed: () {},
                        ),
                        GSText(
                            text: text,
                            size: GSSizes.$xs,
                            bold: true,
                            style: GSStyle(color: GSTheme.of(context).black))
                      ],
                    ),
                  )),
                ),
                GSBox(
                  style: GSStyle(
                    color: isHovered && showBottomBar
                        ? const Color.fromARGB(255, 255, 59, 59)
                        : Color.fromARGB(0, 0, 0, 0),
                    height: 3,
                  ),
                  child: GSText(
                    size: GSSizes.$sm,
                    text: text,
                    style: GSStyle(
                      color: Color.fromARGB(0, 0, 0, 0),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class MenDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) {
        Future.delayed(Duration(milliseconds: 100), () {
          _CustomAppBarState? appBarState =
              context.findAncestorStateOfType<_CustomAppBarState>();
          if (appBarState != null) {
            appBarState.setState(() {
              appBarState.isDropdownVisible = false;
            });
          }
        });
      },
      child: GSBox(
        style: GSStyle(
          width: MediaQuery.of(context).size.width,
          color: GSTheme.of(context).background0,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategory(
                  "Topwear", ["T-Shirts", "Casual Shirts", "Formal Shirts"]),
              _buildCategory("Bottomwear",
                  ["Jeans", "Casual Trousers", "Formal Trousers"]),
              _buildCategory(
                  "Footwear", ["Casual Shoes", "Sports Shoes", "Formal Shoes"]),
              // Add more categories as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ...items.map((item) => Text(item)).toList(),
        ],
      ),
    );
  }
}

class WomenDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) {
        Future.delayed(Duration(milliseconds: 100), () {
          _CustomAppBarState? appBarState =
              context.findAncestorStateOfType<_CustomAppBarState>();
          if (appBarState != null) {
            appBarState.setState(() {
              appBarState.isDropdownVisible = false;
            });
          }
        });
      },
      child: GSBox(
        style: GSStyle(
          color: GSTheme.of(context).background0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              vertical: getResponsiveValue(
                    context: context,
                    xsValue: 6,
                    smValue: 16,
                    xlValue: 20,
                  ) ??
                  0,
              horizontal: getResponsiveValue(
                    context: context,
                    xsValue: 6,
                    smValue: 16,
                    xlValue: 20,
                  ) ??
                  0),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategory("Indian & Fusion Wear",
                  ["Kurtas & Suits", "Sarees", "Ethnic Wear"]),
              _buildCategory("Western Wear",
                  ["Dresses", "Tops", "Jeans", "Trousers", "Capris"]),
              _buildCategory(
                  "Footwear", ["Casual Shoes", "Heels", "Boots", "Flats"]),
              // Add more categories as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ...items.map((item) => Text(item)).toList(),
        ],
      ),
    );
  }
}
