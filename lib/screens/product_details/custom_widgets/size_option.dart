import 'package:gluestack_ui/gluestack_ui.dart';

class SizeSelector extends StatefulWidget {
  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String? selectedSize;

  void onSizeSelected(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GSHStack(
      children: [
        SizeOption(
          size: '4',
          isSelected: selectedSize == '4',
          onSelected: onSizeSelected,
        ),
        SizeOption(
          size: '5',
          quantityLeft: 1,
          isSelected: selectedSize == '5',
          onSelected: onSizeSelected,
        ),
        SizeOption(
          size: '6',
          quantityLeft: 4,
          isSelected: selectedSize == '6',
          onSelected: onSizeSelected,
        ),
        SizeOption(
          size: '7',
          isSelected: selectedSize == '7',
          onSelected: onSizeSelected,
        ),
        SizeOption(
          size: '8',
          isSelected: selectedSize == '8',
          onSelected: onSizeSelected,
        ),
      ],
    );
  }
}

class SizeOption extends StatelessWidget {
  final String size;
  final int? quantityLeft;
  final bool isSelected;
  final Function(String) onSelected;

  const SizeOption({
    required this.size,
    this.quantityLeft,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GSStack(
        children: [
          GSFocusableActionDetector(
            child: Builder(builder: (context) {
              final isHovered =
                  GSFocusableActionDetectorProvider.isHovered(context);
              return GSButton(
                variant: GSButtonVariants.outline,
                onPressed: () {
                  onSelected(size);
                },
                child: GSText(
                    text: size,
                    bold: true,
                    style: GSStyle(
                      bg: Color.fromARGB(255, 5, 40, 42),
                      color:
                          isSelected ? Color.fromARGB(255, 255, 67, 108) : null,
                      textStyle: TextStyle(
                        fontSize: 12,
                      ),
                    )),
                style: GSStyle(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(0),
                    onHover: GSStyle(bg: Color.fromARGB(0, 0, 0, 0)),
                    borderColor: isSelected
                        ? Color.fromARGB(255, 255, 67, 108)
                        : (isHovered
                            ? Color.fromARGB(255, 255, 67, 108)
                            : GSTheme.of(context).trueGray400),
                    borderRadius: 30,
                    borderWidth: 1),
              );
            }),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Visibility(
              visible: quantityLeft != null,
              child: GSBox(
                  child: Center(
                      child: GSText(
                    text: "$quantityLeft left",
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
