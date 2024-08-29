import 'package:gluestack_ui/gluestack_ui.dart';

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