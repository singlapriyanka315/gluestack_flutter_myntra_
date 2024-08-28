import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        width: MediaQuery.of(context).size.width,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GSVStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 24),
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
                    GSText(
                      text: " / Women Footwear",
                      style: GSStyle(
                        textStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        color: GSTheme.of(context).black,
                      ),
                    ),
                    GSText(
                      text: " / Casual",
                      bold: true,
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
              // Product Images in Grid
              GSHStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of images per row
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3 / 4),
                        itemCount: 7, // Number of images
                        itemBuilder: (context, index) {
                          List<String> images = [
                            'assets/images/aldo.jpg',
                            'assets/images/mochi.jpg',
                            'assets/images/mochi.jpg',
                            'assets/images/aldo.jpg',
                            'assets/images/aldo.jpg',
                            'assets/images/aldo.jpg',
                            'assets/images/aldo.jpg',
                          ];
                          return GSFocusableActionDetector(
                            mouseCursor: SystemMouseCursors.zoomIn,
                            child: Builder(builder: (context) {
                              final isHovered =
                                  GSFocusableActionDetectorProvider.isHovered(
                                      context);
                              return ClipRect(
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  transform: isHovered
                                      ? (Matrix4.identity()..scale(1.2))
                                      : Matrix4.identity()
                                    ..scale(1),
                                  transformAlignment: Alignment.center,
                                  child: GSImage(
                                    path: images[index],
                                    imageType: GSImageType.asset,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: GSVStack(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Product Info
                          GSText(
                              text: 'Campus',
                              bold: true,
                              style: GSStyle(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis),
                              )),
                          GSBox(
                            style: GSStyle(height: 8),
                          ),
                          GSText(
                              text: 'Women Round Toe Memory Foam Sneakers',
                              style: GSStyle(
                                color: GSTheme.of(context).trueGray400,
                                textStyle: TextStyle(fontSize: 16),
                              )),
                          GSBox(
                            style: GSStyle(height: 8),
                          ),
                          FittedBox(
                            child: GSFocusableActionDetector(
                                child: Builder(builder: (context) {
                              final isHovered =
                                  GSFocusableActionDetectorProvider.isHovered(
                                      context);
                              return GSBox(
                                style: GSStyle(
                                    borderRadius: 4,
                                    borderColor: isHovered
                                        ? GSTheme.of(context).trueGray700
                                        : GSTheme.of(context).trueGray300,
                                    borderWidth: 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GSHStack(
                                    children: [
                                      GSBox(
                                        style: GSStyle(width: 8),
                                      ),
                                      GSText(
                                          text: "4",
                                          bold: true,
                                          style: GSStyle(
                                              textStyle: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      GSBox(
                                        style: GSStyle(width: 4),
                                      ),
                                      GSIcon(
                                        icon: Icons.star,
                                        style: GSStyle(
                                            color: Color.fromARGB(
                                                255, 11, 168, 118)),
                                      ),
                                      GSBox(
                                        style: GSStyle(width: 4),
                                      ),
                                      GSDivider(
                                        style: GSStyle(
                                          height: 20,
                                        ),
                                        orientation: GSOrientations.vertical,
                                      ),
                                      GSBox(
                                        style: GSStyle(width: 4),
                                      ),
                                      GSText(
                                          text: "24 Ratings",
                                          style: GSStyle(
                                            color:
                                                GSTheme.of(context).trueGray500,
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                            ),
                                          )),
                                      GSBox(
                                        style: GSStyle(width: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                          ),
                          GSBox(style: GSStyle(height: 10)),
                          GSDivider(),
                          GSBox(style: GSStyle(height: 10)),

                          // Price and Discount
                          FittedBox(
                            child: GSHStack(
                              children: [
                                GSText(
                                    text: '₹1325',
                                    bold: true,
                                    style: GSStyle(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )),
                                GSBox(style: GSStyle(width: 10)),
                                GSText(
                                  text: 'MRP ',
                                  style: GSStyle(
                                      color: GSTheme.of(context).trueGray500,
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                      )),
                                ),
                                GSText(
                                  text: '₹1699',
                                  strikeThrough: true,
                                  style: GSStyle(
                                      color: GSTheme.of(context).trueGray500,
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                      )),
                                ),
                                GSBox(style: GSStyle(width: 10)),
                                GSText(
                                    text: '(22% OFF)',
                                    bold: true,
                                    style: GSStyle(
                                      color: Color.fromARGB(255, 255, 140, 51),
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          GSBox(style: GSStyle(height: 10)),
                          GSText(
                            text: 'inclusive of all taxes',
                            bold: true,
                            style: GSStyle(
                                color: Color.fromARGB(255, 11, 168, 118),
                                textStyle: TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 10,
                                )),
                          ),
                          GSBox(style: GSStyle(height: 10)),

                          GSText(
                            text: 'More Colors'.toUpperCase(),
                            bold: true,
                            style: GSStyle(
                                textStyle: TextStyle(
                              fontSize: 14,
                            )),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: FittedBox(
                              child: GSHStack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: GSImage(
                                        fit: BoxFit.cover,
                                        path: 'assets/images/aldo.jpg',
                                        imageType: GSImageType.asset),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: GSImage(
                                        fit: BoxFit.cover,
                                        path: 'assets/images/mochi.jpg',
                                        imageType: GSImageType.asset),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: GSImage(
                                        fit: BoxFit.cover,
                                        path: 'assets/images/mochi.jpg',
                                        imageType: GSImageType.asset),
                                  )
                                ],
                              ),
                            ),
                          ),

                          GSBox(style: GSStyle(height: 10)),

                          // Size Selector
                          FittedBox(
                            child: GSHStack(
                              children: [
                                GSText(
                                    text: 'SELECT SIZE (UK Size)',
                                    bold: true,
                                    style: GSStyle(
                                      textStyle: TextStyle(
                                        letterSpacing: 0.5,
                                        fontSize: 14,
                                      ),
                                    )),
                                GSBox(
                                  style: GSStyle(width: 20),
                                ),
                                GSText(
                                    text: 'Size Chart >'.toUpperCase(),
                                    bold: true,
                                    style: GSStyle(
                                      color: Color.fromARGB(255, 255, 67, 108),
                                      textStyle: TextStyle(
                                        letterSpacing: 0.5,
                                        fontSize: 12,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          GSBox(
                            style: GSStyle(height: 8),
                          ),
                          FittedBox(
                            child: GSHStack(
                              children: [
                                SizeOption(size: '4'),
                                SizeOption(size: '5', quantityLeft: 1),
                                SizeOption(size: '6', quantityLeft: 4),
                                SizeOption(size: '7'),
                                SizeOption(size: '8'),
                              ],
                            ),
                          ),
                          GSBox(style: GSStyle(height: 20)),

                          // Add to Bag Button

                          FittedBox(
                            child: GSHStack(
                              children: [
                                GSButton(
                                    style: GSStyle(
                                      width: 250,
                                      height: 50,
                                      onHover: GSStyle(
                                        bg: Color.fromARGB(255, 255, 114, 144),
                                      ),
                                      bg: Color.fromARGB(255, 255, 67, 108),
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: GSHStack(children: [
                                          GSIcon(
                                              icon: Icons.shopping_bag_outlined,
                                              style: GSStyle(
                                                  color: GSTheme.of(context)
                                                      .trueGray50)),
                                          GSBox(
                                            style: GSStyle(width: 5),
                                          ),
                                          GSText(
                                              text: 'ADD TO BAG',
                                              bold: true,
                                              style: GSStyle(
                                                  textStyle: TextStyle(
                                                      fontSize:
                                                          getResponsiveValue(
                                                                  context:
                                                                      context,
                                                                  xsValue: 6,
                                                                  smValue: 8,
                                                                  mdValue: 10,
                                                                  lgValue: 12,
                                                                  xlValue:
                                                                      14) ??
                                                              14,
                                                      letterSpacing: 0.8),
                                                  color: GSTheme.of(context)
                                                      .trueGray50)),
                                        ]),
                                      ),
                                    ),
                                    onPressed: () {}),
                                GSBox(
                                  style: GSStyle(width: 20),
                                ),
                                GSButton(
                                    style: GSStyle(
                                      height: 50,
                                      onHover: GSStyle(
                                        borderColor: GSTheme.of(context).black,
                                      ),
                                      borderWidth: 0.6,
                                      borderColor:
                                          GSTheme.of(context).trueGray400,
                                      bg: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: GSHStack(children: [
                                          GSIcon(
                                              icon: Icons
                                                  .favorite_border_outlined,
                                              style: GSStyle()),
                                          GSBox(
                                            style: GSStyle(width: 5),
                                          ),
                                          GSText(
                                              text: 'Wishlist'.toUpperCase(),
                                              bold: true,
                                              style: GSStyle(
                                                textStyle: TextStyle(
                                                    fontSize:
                                                        getResponsiveValue(
                                                                context:
                                                                    context,
                                                                xsValue: 6,
                                                                smValue: 8,
                                                                mdValue: 10,
                                                                lgValue: 12,
                                                                xlValue: 14) ??
                                                            14,
                                                    letterSpacing: 0.8),
                                              )),
                                        ]),
                                      ),
                                    ),
                                    onPressed: () {}),
                                // Flexible(flex: 3, child: GSBox()),
                              ],
                            ),
                          ),
                          GSBox(style: GSStyle(height: 20)),
                          GSDivider(),
                          GSBox(style: GSStyle(height: 30)),
                          GSHStack(
                            children: [
                              GSText(
                                  bold: true,
                                  text: 'Delivery Options'.toUpperCase(),
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: GSIcon(
                                    icon: Icons.delivery_dining_outlined),
                              )
                            ],
                          ),

                          GSBox(style: GSStyle(height: 20)),

                          // Enter pin input
                          GSInput(
                            style: GSStyle(
                                onFocus: GSStyle(
                                    borderColor:
                                        GSTheme.of(context).trueGray200),
                                borderWidth: 1.5,
                                onHover: GSStyle(
                                    borderColor:
                                        GSTheme.of(context).trueGray200),
                                width: 200,
                                borderColor: GSTheme.of(context).trueGray200),
                            hintText: "Enter pincode",
                            cursorColor: GSTheme.of(context).trueGray600,
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: GSTheme.of(context).trueGray400),
                            suffixIcon: GSText(
                              text: "Check",
                              bold: true,
                              style: GSStyle(
                                textStyle: TextStyle(fontSize: 12),
                                color: Color.fromARGB(255, 255, 67, 108),
                              ),
                            ),
                          ),

                          GSBox(style: GSStyle(height: 10)),

                          GSText(
                              text:
                                  "Please enter PIN code to check delivery time & Pay on Delivery Availability",
                              style: GSStyle(
                                color: GSTheme.of(context).trueGray600,
                                textStyle: TextStyle(fontSize: 12),
                              )),
                          GSBox(style: GSStyle(height: 20)),
                          GSText(
                              text: '100% Original Products',
                              style: GSStyle(
                                color: GSTheme.of(context).trueGray700,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 5)),
                          GSText(
                              text: 'Pay on delivery might be available',
                              style: GSStyle(
                                color: GSTheme.of(context).trueGray700,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 5)),
                          GSText(
                              text: 'Easy 14 days returns and exchanges',
                              style: GSStyle(
                                color: GSTheme.of(context).trueGray700,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 30)),

                          // Offers Section
                          GSHStack(
                            children: [
                              GSText(
                                  text: 'BEST OFFERS',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.0),
                                child: GSIcon(icon: Icons.discount_outlined),
                              )
                            ],
                          ),
                          GSBox(
                            style: GSStyle(height: 20),
                          ),
                          GSHStack(
                            children: [
                              GSText(
                                  text: 'Best Price: ',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                              GSText(
                                  text: 'Rs.1125',
                                  bold: true,
                                  style: GSStyle(
                                    color: Color.fromARGB(255, 255, 140, 51),
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                            ],
                          ),
                          GSBox(
                            style: GSStyle(height: 15),
                          ),

                          GSHStack(
                            children: [
                              GSText(
                                  text: '• ',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: GSTheme.of(context).black),
                                  )),
                              GSText(
                                  text:
                                      'Applicable on: Orders above Rs. 599 (only on first purchase)',
                                  style: GSStyle(
                                    color: GSTheme.of(context).trueGray600,
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                            ],
                          ),

                          GSBox(
                            style: GSStyle(height: 8),
                          ),

                          GSHStack(
                            children: [
                              GSText(
                                  text: '• ',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: GSTheme.of(context).black),
                                  )),
                              GSText(
                                  text: 'Coupon Code:',
                                  style: GSStyle(
                                    color: GSTheme.of(context).trueGray600,
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                              GSText(
                                  text: ' MYNTRA200',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                            ],
                          ),

                          GSBox(
                            style: GSStyle(height: 8),
                          ),

                          GSHStack(
                            children: [
                              GSText(
                                  text: '• ',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: GSTheme.of(context).black),
                                  )),
                              GSText(
                                  text:
                                      'Coupon Discount: Rs. 200 off (check cart for final savings)',
                                  style: GSStyle(
                                    color: GSTheme.of(context).trueGray600,
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                            ],
                          ),

                          GSBox(style: GSStyle(height: 20)),

                          GSText(
                              text: 'View Eligible Products',
                              bold: true,
                              style: GSStyle(
                                color: Color.fromARGB(255, 255, 67, 108),
                                textStyle: TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 12,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 10)),

                          GSText(
                              text: '7.5% Discount on Myntra Kotak Credit Card',
                              bold: true,
                              style: GSStyle(
                                textStyle: TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 14,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 10)),

                          GSHStack(
                            children: [
                              GSText(
                                  text: '• ',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                              GSText(
                                  text:
                                      'Max Discount Up to ₹750 on every spends.',
                                  style: GSStyle(
                                    color: GSTheme.of(context).trueGray600,
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                        color: GSTheme.of(context).black),
                                  )),
                            ],
                          ),

                          GSBox(style: GSStyle(height: 20)),

                          GSText(
                              text: 'Terms & Condition',
                              bold: true,
                              style: GSStyle(
                                color: Color.fromARGB(255, 255, 67, 108),
                                textStyle: TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 12,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 10)),

                          GSText(
                              text: 'EMI option available',
                              bold: true,
                              style: GSStyle(
                                textStyle: TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 14,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 10)),

                          GSHStack(
                            children: [
                              GSText(
                                  text: '• ',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: GSTheme.of(context).black),
                                  )),
                              GSText(
                                  text: 'EMI starting from Rs.62/month',
                                  style: GSStyle(
                                    color: GSTheme.of(context).trueGray600,
                                    textStyle: TextStyle(
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                        color: GSTheme.of(context).black),
                                  )),
                            ],
                          ),

                          GSBox(style: GSStyle(height: 20)),

                          GSText(
                              text: 'View Plan',
                              bold: true,
                              style: GSStyle(
                                color: Color.fromARGB(255, 255, 67, 108),
                                textStyle: TextStyle(
                                  letterSpacing: 0.6,
                                  fontSize: 12,
                                ),
                              )),
                          GSBox(style: GSStyle(height: 20)),
                          GSDivider(),
                          GSBox(style: GSStyle(height: 20)),

                          GSHStack(
                            children: [
                              GSText(
                                  text: 'Product Details ',
                                  bold: true,
                                  style: GSStyle(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.0),
                                child: GSIcon(icon: Icons.notes_outlined),
                              )
                            ],
                          ),
                          GSBox(
                            style: GSStyle(height: 10),
                          ),

                          ProductDetails(
                              productDetail:
                                  "A pair of round toe white sneakers ,has regular styling,"),
                          ProductDetails(productDetail: "Lace-ups detail"),
                          ProductDetails(productDetail: "Pu upper"),
                          ProductDetails(productDetail: "Cushioned footbed"),
                          ProductDetails(
                              productDetail: "Textured and patterned outsole"),
                          ProductDetails(productDetail: "Warranty: 1 month"),
                          ProductDetails(
                              productDetail:
                                  "Warranty provided by brand/manufacturer"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GSBox(style: GSStyle(height: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeOption extends StatefulWidget {
  final String size;
  final int? quantityLeft;

  const SizeOption({required this.size, this.quantityLeft});

  @override
  _SizeOptionState createState() => _SizeOptionState();
}

class _SizeOptionState extends State<SizeOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    isSelected = false;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GSStack(
        children: [
          GSFocusableActionDetector(
            child: Builder(builder: (context) {
              final isHovered =
                  GSFocusableActionDetectorProvider.isHovered(context);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected; // Toggle the selected state
                  });
                },
                child: Builder(builder: (context) {
                  final selected = isSelected;
                  return GSBox(
                      style: GSStyle(
                          height: 40,
                          width: 40,
                          borderColor: selected
                              ? Color.fromARGB(255, 255, 67, 108)
                              : (isHovered
                                  ? Color.fromARGB(255, 255, 67, 108)
                                  : GSTheme.of(context).trueGray400),
                          borderRadius: 20,
                          borderWidth: 1),
                      child: Center(
                          child: GSText(
                              text: widget.size,
                              bold: true,
                              style: GSStyle(
                                color: selected
                                    ? Color.fromARGB(255, 255, 67, 108)
                                    : null,
                                textStyle: TextStyle(
                                  fontSize: 12,
                                ),
                              ))));
                }),
              );
            }),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Visibility(
              visible: widget.quantityLeft != null,
              child: GSBox(
                  child: Center(
                      child: GSText(
                    text: "${widget.quantityLeft} left",
                    style: GSStyle(
                        color: GSTheme.of(context).white,
                        textStyle: TextStyle(fontSize: 8)),
                  )),
                  style: GSStyle(
                    borderRadius: 2,
                    height: 12,
                    color: Color.fromARGB(255, 255, 136, 45),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final String productDetail;

  const ProductDetails({required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GSText(
          text: productDetail,
          style: GSStyle(
            color: GSTheme.of(context).trueGray800,
            textStyle: TextStyle(
              letterSpacing: 0.2,
              fontSize: 14,
            ),
          )),
    );
  }
}
