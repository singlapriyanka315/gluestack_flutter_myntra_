import 'dart:async';
import 'package:myntra_clone/myntra_export.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AllCategoryScreen> {
  final PageController _pageController = PageController(viewportFraction: 1);
  final PageController _bottomPageController =
      PageController(viewportFraction: 1);
  final PageController _globalBottomPageController =
      PageController(viewportFraction: 1);

  Timer? _topTimer;
  Timer? _bottomTimer;
  Timer? _globalBottomTimer;

  int _currentPage = 0;
  int _currentBottomPage = 0;
  int _currentGlobalBottomPage = 0;

  final List<Map<String, String>> carouselItems = [
    {'image': 'assets/images/image1.png'},
    {'image': 'assets/images/image2.png'},
    {'image': 'assets/images/image3.png'},
    {'image': 'assets/images/image4.png'},
    {'image': 'assets/images/image5.png'},
  ];

  @override
  void initState() {
    super.initState();
    _startTopAutoScroll();
    _startBottomAutoScroll();
    _startGlobalBottomAutoScroll();
  }

  @override
  void dispose() {
    _topTimer?.cancel();
    _bottomTimer?.cancel();
    _globalBottomTimer?.cancel();
    _pageController.dispose();
    _bottomPageController.dispose();
    _globalBottomPageController.dispose();
    super.dispose();
  }

  void _startTopAutoScroll() {
    _topTimer?.cancel();
    _topTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < carouselItems.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _startBottomAutoScroll() {
    _bottomTimer?.cancel();
    _bottomTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentBottomPage <
          (brandItems.length / _calculateItemsPerPage(context)).ceil() - 1) {
        _currentBottomPage++;
      } else {
        _currentBottomPage = 0;
      }
      if (_bottomPageController.hasClients) {
        _bottomPageController.animateToPage(
          _currentBottomPage,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _startGlobalBottomAutoScroll() {
    _globalBottomTimer?.cancel();
    _globalBottomTimer =
        Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentGlobalBottomPage <
          (globalBrandItems.length / _calculateItemsPerPage(context)).ceil() -
              1) {
        _currentGlobalBottomPage++;
      } else {
        _currentGlobalBottomPage = 0;
      }
      if (_globalBottomPageController.hasClients) {
        _globalBottomPageController.animateToPage(
          _currentGlobalBottomPage,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _onDotPressed(int index) {
    setState(() {
      _currentPage = index;
      if (_pageController.hasClients) {
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      }
      _startTopAutoScroll();
    });
  }

  void _onBottomDotPressed(int index) {
    setState(() {
      _currentBottomPage = index;
      _bottomPageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      _startBottomAutoScroll();
    });
  }

  void _onGlobalBottomDotPressed(int index) {
    setState(() {
      _currentGlobalBottomPage = index;
      _globalBottomPageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      _startGlobalBottomAutoScroll();
    });
  }

  int _calculateItemsPerPage(BuildContext context) {
    return getResponsiveValue(
            context: context,
            xsValue: 3,
            smValue: 3,
            mdValue: 6,
            lgValue: 6,
            xlValue: 6) ??
        6;
  }

  @override
  Widget build(BuildContext context) {
    final itemsPerPage = _calculateItemsPerPage(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return GSVStack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: getResponsiveValue(
                      context: context,
                      xsValue: 5,
                      smValue: 8,
                      mdValue: 15,
                      lgValue: 30) ??
                  30),
          child: GSVStack(
            children: [
              GSBox(
                style: GSStyle(
                  height: getResponsiveValue(
                          context: context,
                          xsValue: 100,
                          smValue: 200,
                          mdValue: 300,
                          lgValue: 400,
                          xlValue: 400) ??
                      400.0,
                ),
                child: PageView.builder(
                  onPageChanged: (int index) {
                    screenWidth < 850
                        ? setState(() {
                            _currentPage = index;
                            _startTopAutoScroll();
                          })
                        : null;
                  },
                  controller: _pageController,
                  itemCount: carouselItems.length,
                  physics: screenWidth < 850
                      ? AlwaysScrollableScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GSBox(
                      child: ClipRRect(
                        child: GsGestureDetector(
                          onPressed: () {
                            context.push("/category");
                          },
                          child: GSImage(
                            path: carouselItems[index]['image']!,
                            imageType: GSImageType.asset,
                            fit: BoxFit.fitWidth,
                            style: GSStyle(
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              GSHStack(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  carouselItems.length,
                  (index) => GsGestureDetector(
                    onPressed: () => _onDotPressed(index),
                    child: GSBox(
                      style: GSStyle(
                        color: _currentPage == index
                            ? GSTheme.of(context).trueGray500
                            : GSTheme.of(context).trueGray200,
                        margin: const EdgeInsets.all(6.0),
                        width: 8,
                        height: 8,
                        borderRadius: 20,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveValue(
                      context: context,
                      xsValue: 8,
                      smValue: 12,
                      mdValue: 20,
                      lgValue: 24) ??
                  24,
              vertical: getResponsiveValue(
                      context: context,
                      xsValue: 15,
                      smValue: 25,
                      mdValue: 35,
                      lgValue: 50) ??
                  50),
          child: GSHStack(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: GSText(
                  text: "Medal Worthy Brands To Bag".toUpperCase(),
                  bold: true,
                  style: GSStyle(
                      lg: GSStyle(
                          textStyle:
                              const TextStyle(wordSpacing: 2, fontSize: 40)),
                      md: GSStyle(
                          textStyle:
                              const TextStyle(wordSpacing: 2, fontSize: 30)),
                      sm: GSStyle(
                          textStyle:
                              const TextStyle(wordSpacing: 2, fontSize: 22)),
                      xs: GSStyle(
                          textStyle:
                              const TextStyle(wordSpacing: 2, fontSize: 18)),
                      color: GSTheme.of(context).trueGray600,
                      textStyle: const TextStyle(wordSpacing: 2)),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
        GSBox(
            style: GSStyle(
              height: getResponsiveValue(
                  context: context,
                  xsValue: 220,
                  smValue: 240,
                  mdValue: 260,
                  lgValue: 280,
                  xlValue: 320),
            ),
            child: GSVStack(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _bottomPageController,
                    itemCount: (brandItems.length / itemsPerPage).ceil(),
                    onPageChanged: (int index) {
                      setState(() {
                        _currentBottomPage = index;
                        _startBottomAutoScroll();
                      });
                    },
                    itemBuilder: (context, pageIndex) {
                      return CustomCard(
                          items: brandItems,
                          pageIndex: pageIndex,
                          itemsPerPage: itemsPerPage);
                    },
                  ),
                ),
                GSHStack(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    (brandItems.length / itemsPerPage).ceil(),
                    (index) => GsGestureDetector(
                      onPressed: () => _onBottomDotPressed(index),
                      child: GSBox(
                        style: GSStyle(
                          color: _currentBottomPage == index
                              ? GSTheme.of(context).trueGray500
                              : GSTheme.of(context).trueGray200,
                          margin: const EdgeInsets.all(6.0),
                          width: getResponsiveValue(
                              context: context,
                              xsValue: 0,
                              smValue: 0,
                              mdValue: 8,
                              lgValue: 8,
                              xlValue: 8),
                          height: getResponsiveValue(
                              context: context,
                              xsValue: 0,
                              smValue: 0,
                              mdValue: 8,
                              lgValue: 8,
                              xlValue: 8),
                          borderRadius: 20,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveValue(
                      context: context,
                      xsValue: 8,
                      smValue: 12,
                      mdValue: 20,
                      lgValue: 24) ??
                  24,
              vertical: getResponsiveValue(
                      context: context,
                      xsValue: 15,
                      smValue: 25,
                      mdValue: 35,
                      lgValue: 50) ??
                  50),
          child: GSHStack(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GSText(
                text: "Grand Global Brands".toUpperCase(),
                bold: true,
                style: GSStyle(
                    lg: GSStyle(
                        textStyle:
                            const TextStyle(wordSpacing: 2, fontSize: 40)),
                    md: GSStyle(
                        textStyle:
                            const TextStyle(wordSpacing: 2, fontSize: 30)),
                    sm: GSStyle(
                        textStyle:
                            const TextStyle(wordSpacing: 2, fontSize: 22)),
                    xs: GSStyle(
                        textStyle:
                            const TextStyle(wordSpacing: 2, fontSize: 18)),
                    color: GSTheme.of(context).trueGray600,
                    textStyle: const TextStyle(wordSpacing: 2)),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
        GSBox(
            style: GSStyle(
              height: getResponsiveValue(
                  context: context,
                  xsValue: 220,
                  smValue: 240,
                  mdValue: 260,
                  lgValue: 280,
                  xlValue: 320),
            ),
            child: GSVStack(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _globalBottomPageController,
                    itemCount: (globalBrandItems.length / itemsPerPage).ceil(),
                    onPageChanged: (int index) {
                      setState(() {
                        _currentGlobalBottomPage = index;
                        _startGlobalBottomAutoScroll();
                      });
                    },
                    itemBuilder: (context, pageIndex) {
                      return CustomCard(
                          items: globalBrandItems,
                          pageIndex: pageIndex,
                          itemsPerPage: itemsPerPage);
                    },
                  ),
                ),
                GSHStack(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    (globalBrandItems.length / itemsPerPage).ceil(),
                    (index) => GsGestureDetector(
                      onPressed: () => _onGlobalBottomDotPressed(index),
                      child: GSBox(
                        style: GSStyle(
                          color: _currentGlobalBottomPage == index
                              ? GSTheme.of(context).trueGray500
                              : GSTheme.of(context).trueGray200,
                          margin: const EdgeInsets.all(6.0),
                          width: getResponsiveValue(
                              context: context,
                              xsValue: 0,
                              smValue: 0,
                              mdValue: 8,
                              lgValue: 8,
                              xlValue: 8),
                          height: getResponsiveValue(
                              context: context,
                              xsValue: 0,
                              smValue: 0,
                              mdValue: 8,
                              lgValue: 8,
                              xlValue: 8),
                          borderRadius: 20,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        GSBox(
          style: GSStyle(
            height: 30,
            md: GSStyle(isVisible: false),
            xs: GSStyle(isVisible: false),
            sm: GSStyle(isVisible: false),
          ),
        ),
        GSBox(
            style: GSStyle(
              md: GSStyle(isVisible: false),
              xs: GSStyle(isVisible: false),
              sm: GSStyle(isVisible: false),
            ),
            child: CustomFooter()),
      ],
    );
  }
}
