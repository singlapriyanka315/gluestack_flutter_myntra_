import 'package:myntra_clone/myntra_export.dart';
import 'package:myntra_clone/screens/product_details/common_widgets/product_detail_actions.dart';
import 'package:myntra_clone/screens/product_details/common_widgets/product_images.dart';

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
                    child: ProductImages(),
                  ),
                  Expanded(
                      flex: getResponsiveValue(
                              context: context,
                              xsValue: 0,
                              smValue: 0,
                              mdValue: 0,
                              lgValue: 5,
                              xlValue: 5) ??
                          5,
                      child: GSBox(
                          style: GSStyle(
                            xs: GSStyle(isVisible: false),
                            sm: GSStyle(isVisible: false),
                            md: GSStyle(isVisible: false),
                            lg: GSStyle(isVisible: true),
                          ),
                          child: ProductDetailActions())),
                ],
              ),
              GSBox(
                  style: GSStyle(
                    xs: GSStyle(isVisible: true),
                    sm: GSStyle(isVisible: true),
                    md: GSStyle(isVisible: true),
                    lg: GSStyle(isVisible: false),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: ProductDetailActions(),
                  )),

              GSBox(style: GSStyle(height: 70)),
              GSBox(
                style: GSStyle(
                  height: 30,
                  lg: GSStyle(isVisible: true),
                  md: GSStyle(isVisible: false),
                  xs: GSStyle(isVisible: false),
                  sm: GSStyle(isVisible: false),
                ),
              ),
              GSBox(
                  style: GSStyle(
                    lg: GSStyle(isVisible: true),
                    md: GSStyle(isVisible: false),
                    xs: GSStyle(isVisible: false),
                    sm: GSStyle(isVisible: false),
                  ),
                  child: CustomFooter()),
            ],
          ),
        ),
      ),
    );
  }
}
