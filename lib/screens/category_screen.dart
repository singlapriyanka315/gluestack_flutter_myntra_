import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        width: MediaQuery.of(context).size.width,
      ),
      child: GSVStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: GSHStack(
              children: [
                GsGestureDetector(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                  child: GSText(
                    text: "Home",
                    style: GSStyle(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      color: GSTheme.of(context).black,
                    ),
                  ),
                ),
                GSText(
                  text: " / Footwear",
                  style: GSStyle(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    color: GSTheme.of(context).black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GSHStack(
              children: [
                GSText(
                  text: "Women Jeans",
                  bold: true,
                  style: GSStyle(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    color: GSTheme.of(context).black,
                  ),
                ),
                GSText(
                  text: " - 25104 items",
                  style: GSStyle(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    color: GSTheme.of(context).trueGray500,
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GSHStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filter Sidebar
                  Expanded(
                    flex: 2, // Controls the width of the sidebar
                    child: GSText(
                      text: "FILTERS",
                      bold: true,
                      style: GSStyle(
                        textStyle: TextStyle(fontSize: 14),
                        color: GSTheme.of(context).black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8, // Controls the width of the product grid
                    child: GSText(
                      text: "BUNDLE",
                      style: GSStyle(
                        textStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        color: GSTheme.of(context).trueGray700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IntrinsicHeight(
            child: GSHStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Filter Sidebar
                Expanded(
                  flex: 2, // Controls the width of the sidebar
                  child: FilterSidebar(),
                ),
                Expanded(
                  flex: 8, // Controls the width of the product grid
                  child: ProductGrid(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
          bg: GSTheme.of(context).white,
          borderColor: GSTheme.of(context).trueGray300),
      child: GSVStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Sections
          GSBox(
            style: GSStyle(
              borderColor: GSTheme.of(context).trueGray300,
              width: MediaQuery.of(context).size.width,
            ),
            child: FilterSection(title: "Brand".toUpperCase(), options: [
              "Roadster",
              "BAESD",
              "SHOWOFF",
              "Levis",
              "Tokyo Talkies",
              "DressBerry",
            ], numbersOfProducts: [
              1233,
              74664,
              7638,
              7646,
              10,
              289
            ]),
          ),

          // GSBox(
          //   style: GSStyle(
          //     borderColor: GSTheme.of(context).trueGray300,
          //     width: MediaQuery.of(context).size.width,
          //   ),
          //   child: FilterSection(
          //     title: "Price".toUpperCase(),
          //     customWidget: RangeSlider(
          //       values: RangeValues(300, 10300),
          //       min: 0,
          //       max: 20000,
          //       onChanged: (values) {},
          //     ),
          //   ),
          // ),

          GSBox(
            style: GSStyle(
              borderColor: GSTheme.of(context).trueGray300,
              width: MediaQuery.of(context).size.width,
            ),
            child: FilterSection(title: "Color".toUpperCase(), options: [
              "Blue",
              "Black",
              "Navy Blue",
              "Grey",
              "White",
              "Pink"
            ], numbersOfProducts: [
              1233,
              744,
              27,
              764,
              1,
              289
            ]),
          ),
        ],
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  final String title;
  final List<String>? options;
  final List<int>? numbersOfProducts;
  final Widget? customWidget;

  FilterSection({
    required this.title,
    this.options,
    this.customWidget,
    this.numbersOfProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GSVStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: GSText(
              text: title,
              style: GSStyle(
                color: GSTheme.of(context).black,
                textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          if (options != null && numbersOfProducts != null)
            GSVStack(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(options!.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5),
                  child: FittedBox(
                    child: GSBox(
                      child: GSCheckBox(
                        style: GSStyle(borderWidth: 0.3),
                        size: GSCheckBoxSizes.$sm,
                        onChanged: (value) {},
                        icon: GSBox(
                          style: GSStyle(
                            height: 20,
                            width: 20,
                            borderWidth: 0.3,
                          ),
                          child: FittedBox(
                            child: GSCheckBoxIndicator(
                                style: GSStyle(
                                  borderRadius: 2,
                                  borderWidth: 0.3,
                                ),
                                child: GSCheckBoxIcon()),
                          ),
                        ),
                        value: options![index],
                        label: FittedBox(
                          child: GSHStack(
                            space: GSHstackSpaces.$xs,
                            children: [
                              GSBox(style: GSStyle(width: 6)),
                              GSCheckBoxLabel(
                                text: "${options![index]}",
                                style: GSStyle(
                                    color: GSTheme.of(context).trueGray800,
                                    textStyle: TextStyle(fontSize: 13)),
                              ),
                              numbersOfProducts?[index] != null
                                  ? GSCheckBoxLabel(
                                      text: "(${numbersOfProducts![index]})",
                                      style: GSStyle(
                                          color:
                                              GSTheme.of(context).trueGray400,
                                          textStyle: TextStyle(fontSize: 10)),
                                    )
                                  : GSBox(
                                      style: GSStyle(height: 0),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          if (customWidget != null) FittedBox(child: customWidget!),
        ],
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        bg: GSTheme.of(context).white,
        borderColor: GSTheme.of(context).trueGray300,
        height: MediaQuery.of(context).size.height, // or any other fixed height
        padding: EdgeInsets.all(getResponsiveValue(
                context: context,
                xsValue: 4,
                smValue: 8,
                mdValue: 12,
                lgValue: 16,
                xlValue: 20) ??
            20.0),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 4.0,
          childAspectRatio:
              0.55, // Adjusted to match the elongated aspect ratio
        ),
        itemCount: 25, // Total number of items
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    return getResponsiveValue(
            context: context,
            xsValue: 2,
            smValue: 2,
            mdValue: 3,
            lgValue: 4,
            xlValue: 5) ??
        2;
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        bg: GSTheme.of(context).white,
        borderRadius: 12,
        elevation: 2,
      ),
      child: GSVStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3 / 4, // Elongated aspect ratio for the image
            child: GSImage(
              path: 'assets/images/mochi.jpg',
              imageType: GSImageType.asset,
              fit: BoxFit.cover, // Ensures the image covers the entire area
            ),
          ),
          Padding(
            padding: EdgeInsets.all(getResponsiveValue(
                    context: context,
                    xsValue: 2,
                    smValue: 4,
                    mdValue: 4,
                    lgValue: 6,
                    xlValue: 8) ??
                8.0),
            child: GSVStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: GSText(
                    text: 'MOCHI',
                    bold: true,
                    overflow: TextOverflow.ellipsis,
                    style: GSStyle(
                      color: GSTheme.of(context).black,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                GSText(
                  text: 'Women Embellished Ethnic Handcrafted Mojaris',
                  overflow: TextOverflow.ellipsis,
                  style: GSStyle(
                    color: GSTheme.of(context).trueGray500,
                    textStyle: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                    height: getResponsiveValue(
                        context: context,
                        xsValue: 2,
                        smValue: 4,
                        mdValue: 4,
                        lgValue: 6,
                        xlValue: 8)),
                FittedBox(
                  child: GSText(
                    text: 'Rs. 887 (63% OFF)',
                    bold: true,
                    overflow: TextOverflow.ellipsis,
                    style: GSStyle(
                      color: GSTheme.of(context).black,
                      textStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
