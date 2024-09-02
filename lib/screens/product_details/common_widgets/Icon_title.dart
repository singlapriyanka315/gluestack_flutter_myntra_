import 'package:myntra_clone/myntra_export.dart';

class IconTitleWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  const IconTitleWidget({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GSHStack(
        children: [
          GSText(
              text: title.toUpperCase(),
              bold: true,
              style: GSStyle(
                textStyle: TextStyle(
                  fontSize: 
                      16,
                ),
              )),
          icon != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: GSIcon(icon: icon!),
                )
              : GSBox(),
        ],
      ),
    );
  }
}
