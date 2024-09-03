import 'package:flutter/material.dart';
import 'package:myntra_clone/myntra_export.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/aldo.jpg',
      'assets/images/mochi.jpg',
      'assets/images/mochi.jpg',
      'assets/images/aldo.jpg',
      'assets/images/aldo.jpg',
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of images per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4),
        itemCount: 5, // Number of images
        itemBuilder: (context, index) {
          return ProductImageWidget(index: index, images: images);
        },
      ),
    );
  }
}

class ProductImageWidget extends StatefulWidget {
  final List<String> images;
  final int index;
  const ProductImageWidget(
      {super.key, required this.images, required this.index});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  int lastIndex = 0;

  @override
  void initState() {
    super.initState();
    lastIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return GSFocusableActionDetector(
      mouseCursor: SystemMouseCursors.zoomIn,
      child: Builder(builder: (context) {
        final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
        return ClipRect(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: isHovered
                ? (Matrix4.identity()..scale(1.1))
                : Matrix4.identity()
              ..scale(1),
            transformAlignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                GSAlertDialog.show(
                  context,
                  size: GSAlertDialogSizes.$lg,
                  style: GSStyle(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  content: GSAlertDialogContent(
                    body: GSAlertDialogBody(
                      style: GSStyle(
                        padding: EdgeInsets.all(0),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                      child: StatefulBuilder(
                        builder:
                            (BuildContext context, StateSetter setModalState) {
                          return Stack(
                            children: [
                              SingleChildScrollView(
                                child: GSFocusableActionDetector(
                                  mouseCursor: SystemMouseCursors.allScroll,
                                  child: GSImage(
                                    style: GSStyle(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    path: widget.images[lastIndex],
                                    imageType: GSImageType.asset,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 20,
                                child: GSVStack(
                                  children: List.generate(widget.images.length,
                                      (index) {
                                    return Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: GSBox(
                                        style: GSStyle(
                                            borderWidth: 1,
                                            height: 40,
                                            width: 30,
                                            borderColor: lastIndex == index
                                                ? Color.fromARGB(
                                                    255, 246, 92, 125)
                                                : GSTheme.of(context)
                                                    .trueGray400),
                                        child: GsGestureDetector(
                                          onPressed: () {
                                            setModalState(() {
                                              lastIndex = index;
                                            });
                                          },
                                          child: GSImage(
                                            fit: BoxFit.fill,
                                            path: widget.images[index],
                                            imageType: GSImageType.asset,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height * 0.5,
                                  left: 10,
                                  child: ImageIconButton(
                                      icon: Icons.keyboard_arrow_left,
                                      onPressed: () {
                                        setModalState(() {
                                          if (lastIndex > 0) {
                                            lastIndex--;
                                          }
                                        });
                                      })),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: ImageIconButton(
                                      icon: Icons.close_sharp,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })),
                              Positioned(
                                  right: 10,
                                  top: MediaQuery.of(context).size.height * 0.5,
                                  child: ImageIconButton(
                                      icon: Icons.keyboard_arrow_right,
                                      onPressed: () {
                                        setModalState(() {
                                          if (lastIndex <
                                              widget.images.length - 1) {
                                            lastIndex++;
                                          }
                                        });
                                      })),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              child: GSImage(
                path: widget.images[widget.index],
                imageType: GSImageType.asset,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ImageIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const ImageIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GSButton(
      variant: GSButtonVariants.outline,
      style: GSStyle(
          padding: EdgeInsets.all(0),
          height: 50,
          width: 50,
          onHover: GSStyle(bg: GSTheme.of(context).trueGray300),
          onActive: GSStyle(bg: GSTheme.of(context).white),
          borderColor: GSTheme.of(context).trueGray400,
          color: GSTheme.of(context).trueGray400,
          borderWidth: 1,
          bg: GSTheme.of(context).white),
      onPressed: onPressed,
      child: GSIcon(
        icon: icon,
        style: GSStyle(
          color: GSTheme.of(context).trueGray400,
        ),
      ),
    );
  }
}
