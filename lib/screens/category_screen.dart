import 'package:gluestack_ui/gluestack_ui.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [GSText(text: "HomeFootwear")],
    );
  }
}
