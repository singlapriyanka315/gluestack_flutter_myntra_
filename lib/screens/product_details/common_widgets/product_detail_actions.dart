import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myntra_clone/myntra_export.dart';

class ProductDetailActions extends StatefulWidget {
  const ProductDetailActions({super.key});

  @override
  State<ProductDetailActions> createState() => _ProductDetailActionsState();
}

class _ProductDetailActionsState extends State<ProductDetailActions> {
  Map<String, String> specifications = {
    "Type": "Sneakers",
    "Toe Shape": "Round Toe",
    "Pattern": "Colourblocked",
    "Fastening": "Lace-Ups",
    "Shoe Width": "Regular",
    "Ankle Height": "Regular",
    "Insole": "Comfort Insole",
    "Sole Material": "PVC",
  };
  TextEditingController? inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveValue(
                context: context,
                xsValue: 0,
                smValue: 0,
                mdValue: 0,
                lgValue: 14,
                xlValue: 16) ??
            16,
      ),
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
                    fontSize: getResponsiveValue(
                            context: context,
                            xsValue: 16,
                            smValue: 16,
                            mdValue: 18,
                            lgValue: 18,
                            xlValue: 20) ??
                        20,
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
            child: GSFocusableActionDetector(child: Builder(builder: (context) {
              final isHovered =
                  GSFocusableActionDetectorProvider.isHovered(context);
              return GSBox(
                style: GSStyle(
                    borderRadius: 4,
                    borderColor: isHovered
                        ? GSTheme.of(context).trueGray700
                        : GSTheme.of(context).trueGray300,
                    borderWidth: 1),
                child: Padding(
                  padding: EdgeInsets.all(4),
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
                            height: 14,
                            width: 14,
                            color: Color.fromARGB(255, 11, 168, 118)),
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
                            color: GSTheme.of(context).trueGray500,
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
              children: [SizeSelector()],
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
                        bg: Color.fromARGB(255, 246, 92, 125),
                      ),
                      onActive: GSStyle(
                        bg: Color.fromARGB(255, 246, 92, 125),
                      ),
                      bg: Color.fromARGB(255, 255, 67, 108),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: GSHStack(children: [
                          GSIcon(
                              icon: Icons.shopping_bag_outlined,
                              style: GSStyle(
                                  color: GSTheme.of(context).trueGray50)),
                          GSBox(
                            style: GSStyle(width: 5),
                          ),
                          GSText(
                              text: 'ADD TO BAG',
                              bold: true,
                              style: GSStyle(
                                  textStyle: TextStyle(
                                      fontSize: 14, letterSpacing: 0.8),
                                  color: GSTheme.of(context).trueGray50)),
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
                      onActive: GSStyle(
                        bg: Color.fromARGB(255, 255, 255, 255),
                        borderColor: GSTheme.of(context).black,
                      ),
                      borderWidth: 0.6,
                      borderColor: GSTheme.of(context).trueGray400,
                      bg: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: GSHStack(children: [
                          GSIcon(
                              icon: Icons.favorite_border_outlined,
                              style: GSStyle()),
                          GSBox(
                            style: GSStyle(width: 5),
                          ),
                          GSText(
                              text: 'Wishlist'.toUpperCase(),
                              bold: true,
                              style: GSStyle(
                                textStyle:
                                    TextStyle(fontSize: 14, letterSpacing: 0.8),
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

          IconTitleWidget(
              title: 'Delivery Options ', icon: Icons.delivery_dining_outlined),

          GSBox(style: GSStyle(height: 20)),
          // Enter pin input
          FittedBox(
            child: GSInput(
              controller: inputController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              style: GSStyle(
                  onFocus:
                      GSStyle(borderColor: GSTheme.of(context).trueGray200),
                  borderWidth: 1.5,
                  onHover:
                      GSStyle(borderColor: GSTheme.of(context).trueGray200),
                  width: 200,
                  borderColor: GSTheme.of(context).trueGray200),
              hintText: "Enter pincode",
              cursorColor: GSTheme.of(context).trueGray600,
              hintStyle: TextStyle(
                  fontSize: 14, color: GSTheme.of(context).trueGray400),
              suffixIcon: GSText(
                text: "Check",
                bold: true,
                style: GSStyle(
                  textStyle: TextStyle(fontSize: 12),
                  color: Color.fromARGB(255, 255, 67, 108),
                ),
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
                textStyle: TextStyle(fontSize: 14),
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

          IconTitleWidget(title: 'BEST OFFERS ', icon: Icons.discount_outlined),
          GSBox(
            style: GSStyle(height: 20),
          ),
          FittedBox(
            child: GSHStack(
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
          ),
          GSBox(
            style: GSStyle(height: 15),
          ),

          GSHStack(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GSText(
                  text: '• ',
                  bold: true,
                  style: GSStyle(
                    textStyle: TextStyle(
                        fontSize: 14, color: GSTheme.of(context).black),
                  )),
              Expanded(
                child: GSText(
                    text:
                        'Applicable on: Orders above Rs. 599 (only on first purchase)',
                    style: GSStyle(
                      color: GSTheme.of(context).trueGray600,
                      textStyle: TextStyle(
                          letterSpacing: 0.6,
                          fontSize: 14,
                          color: GSTheme.of(context).black),
                    )),
              ),
            ],
          ),

          GSBox(
            style: GSStyle(height: 8),
          ),

          GSHStack(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GSText(
                  text: '• ',
                  bold: true,
                  style: GSStyle(
                    textStyle: TextStyle(
                        fontSize: 14, color: GSTheme.of(context).black),
                  )),
              Expanded(
                child: Row(
                  children: [
                    FittedBox(
                      child: GSText(
                          text: 'Coupon Code:',
                          style: GSStyle(
                            color: GSTheme.of(context).trueGray600,
                            textStyle: TextStyle(
                                letterSpacing: 0.6,
                                fontSize: 14,
                                color: GSTheme.of(context).black),
                          )),
                    ),
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
              ),
            ],
          ),

          GSBox(
            style: GSStyle(height: 8),
          ),

          GSHStack(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GSText(
                  text: '• ',
                  bold: true,
                  style: GSStyle(
                    textStyle: TextStyle(
                        fontSize: 14, color: GSTheme.of(context).black),
                  )),
              Expanded(
                child: GSText(
                    text:
                        'Coupon Discount: Rs. 200 off (check cart for final savings)',
                    style: GSStyle(
                      color: GSTheme.of(context).trueGray600,
                      textStyle: TextStyle(
                          letterSpacing: 0.6,
                          fontSize: 14,
                          color: GSTheme.of(context).black),
                    )),
              ),
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
                        fontSize: 14, color: GSTheme.of(context).black),
                  )),
              Expanded(
                child: GSText(
                    text: 'Max Discount Up to ₹750 on every spends.',
                    style: GSStyle(
                      color: GSTheme.of(context).trueGray600,
                      textStyle: TextStyle(
                          letterSpacing: 0.6,
                          fontSize: 14,
                          color: GSTheme.of(context).black),
                    )),
              ),
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
                textStyle: TextStyle(letterSpacing: 0.6, fontSize: 14),
              )),
          GSBox(style: GSStyle(height: 10)),

          GSHStack(
            children: [
              GSText(
                  text: '• ',
                  bold: true,
                  style: GSStyle(
                    textStyle: TextStyle(
                        fontSize: 14, color: GSTheme.of(context).black),
                  )),
              Expanded(
                child: GSText(
                    text: 'EMI starting from Rs.62/month',
                    style: GSStyle(
                      color: GSTheme.of(context).trueGray600,
                      textStyle: TextStyle(
                          letterSpacing: 0.6,
                          fontSize: 14,
                          color: GSTheme.of(context).black),
                    )),
              ),
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

          IconTitleWidget(
              title: 'Product Details ', icon: Icons.notes_outlined),
          GSBox(
            style: GSStyle(height: 10),
          ),

          ProductDetails(
              productDetail:
                  "A pair of round toe white sneakers ,has regular styling,"),
          ProductDetails(productDetail: "Lace-ups detail"),
          ProductDetails(productDetail: "Pu upper"),
          ProductDetails(productDetail: "Cushioned footbed"),
          ProductDetails(productDetail: "Textured and patterned outsole"),
          ProductDetails(productDetail: "Warranty: 1 month"),
          ProductDetails(
              productDetail: "Warranty provided by brand/manufacturer"),
          GSBox(style: GSStyle(height: 20)),

          FittedBox(
            child: GSText(
                text: 'Material & Care',
                bold: true,
                style: GSStyle(
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                )),
          ),

          GSBox(
            style: GSStyle(height: 10),
          ),
          ProductDetails(productDetail: "Leather"),
          ProductDetails(
              productDetail:
                  "Gently wipe off any dirt or dust from the surface using a soft, dry cloth."),
          ProductDetails(
              productDetail: "Avoid using water or harsh chemicals."),
          ProductDetails(
              productDetail:
                  "Apply a small amount of leather conditioner to a clean cloth and rub it"),
          GSBox(
            style: GSStyle(height: 20),
          ),
          FittedBox(
            child: GSText(
                text: 'Specifications',
                bold: true,
                style: GSStyle(
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                )),
          ),
          GSBox(
            style: GSStyle(height: 10),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row

              childAspectRatio: getResponsiveValue(
                      context: context,
                      xsValue: 3 / 1,
                      smValue: 4 / 1,
                      mdValue: 6 / 1,
                      lgValue: 4 / 1,
                      xlValue: 4 / 1) ??
                  4 / 1,
            ),
            itemCount: specifications.length, // Total number of specifications
            itemBuilder: (context, index) {
              String key = specifications.keys.elementAt(index);
              String value = specifications[key]!;
              return Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GSVStack(
                  // space: GSVstackSpaces.$xs,
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GSText(
                        text: key,
                        style: GSStyle(
                          color: GSTheme.of(context).trueGray400,
                          textStyle: TextStyle(
                              fontSize: getResponsiveValue(
                                      context: context,
                                      xsValue: 12,
                                      smValue: 12,
                                      mdValue: 12,
                                      lgValue: 10,
                                      xlValue: 12) ??
                                  12),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: GSText(
                        text: value,
                        style: GSStyle(
                            color: GSTheme.of(context).trueGray600,
                            textStyle: TextStyle(
                              fontSize: getResponsiveValue(
                                      context: context,
                                      xsValue: 14,
                                      smValue: 14,
                                      mdValue: 14,
                                      lgValue: 12,
                                      xlValue: 14) ??
                                  14,
                            )),
                      ),
                    ),
                    GSDivider(
                      style: GSStyle(color: GSTheme.of(context).trueGray200),
                    ),
                  ],
                ),
              );
            },
          ),

          GSBox(style: GSStyle(height: 20)),
          IconTitleWidget(title: "Ratings", icon: Icons.star_rate_outlined),

          RatingBoard(),
          GSBox(style: GSStyle(height: 20)),

          IconTitleWidget(
              title: 'What Customers Said ', icon: Icons.star_rate_outlined),
          GSBox(style: GSStyle(height: 10)),

          CustomerReview(title: "Fit", subTitle: 'Tight (50%)', value: 0.5),
          GSBox(style: GSStyle(height: 8)),
          CustomerReview(
              title: "Comfort", subTitle: 'Not Comfortable (50%)', value: 0.5),

          Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: GSModal(
                  size: GSModalSizes.$xs,
                  content: GSModalContent(
                    style: GSStyle(
                      borderRadius: 5,
                    ),
                    header: GSModalHeader(
                      style: GSStyle(padding: EdgeInsets.all(0)),
                      closeButton: GSModalCloseButton(
                        variant: GSButtonVariants.link,
                        icon: GSIcon(
                          icon: Icons.close,
                        ),
                      ),
                    ),
                    body: GSModalBody(
                        child: GSVStack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: GSHStack(
                            children: [
                              GSText(
                                  text: "What customers say about this product",
                                  bold: true,
                                  style: GSStyle()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              title: "Fit",
                              subTitle: 'Tight (50%)',
                              value: 0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              subTitle: 'A Little Tight (0%)', value: 0),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              subTitle: 'Just Right (0%)', value: 0),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              subTitle: 'A Little Loose (0%)', value: 0),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              subTitle: 'Loose (50%)', value: 0.5),
                        ),
                        GSBox(style: GSStyle(height: 12)),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              title: "Comfort",
                              subTitle: 'Not Comfortable (50%)',
                              value: 0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              subTitle: 'Comfortable (50%)', value: 0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomerReview(
                              subTitle: 'Very Comfortable (0%)', value: 0),
                        ),
                        GSBox(style: GSStyle(height: 12)),
                      ],
                    )),
                  ),
                  child: GSText(
                      text: 'View Details',
                      bold: true,
                      style: GSStyle(
                        color: Color.fromARGB(255, 255, 67, 108),
                        textStyle: TextStyle(
                          letterSpacing: 0.6,
                          fontSize: 12,
                        ),
                      )))),
        ],
      ),
    );
  }
}
