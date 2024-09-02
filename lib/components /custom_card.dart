import 'package:myntra_clone/myntra_export.dart';

class CustomCard extends StatefulWidget {
  final List<dynamic> items;
  final int pageIndex;
  final int itemsPerPage;
  CustomCard(
      {super.key,
      required this.items,
      required this.pageIndex,
      required this.itemsPerPage});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GSHStack(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.items
          .skip(widget.pageIndex * widget.itemsPerPage)
          .take(widget.itemsPerPage)
          .map((item) => Expanded(
                child: GSVStack(
                  children: [
                    FittedBox(
                      child: GSBox(
                        style: GSStyle(
                          lg: GSStyle(height: 260, width: 260),
                          md: GSStyle(height: 220, width: 220),
                          sm: GSStyle(height: 180, width: 180),
                          xs: GSStyle(height: 160, width: 160),
                        ),
                        child: FittedBox(
                          child: GSImage(
                            path: item.image,
                            fit: BoxFit.fill,
                            imageType: GSImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    GSBox(
                      style: GSStyle(
                        lg: GSStyle(
                          height: 20,
                        ),
                        md: GSStyle(
                          height: 18,
                        ),
                        sm: GSStyle(
                          height: 18,
                        ),
                        xs: GSStyle(
                          height: 12,
                        ),
                      ),
                      child: FittedBox(
                        child: GSText(
                          text: item.brand,
                          style: GSStyle(
                            lg: GSStyle(
                              textStyle: TextStyle(
                                fontSize: 16,
                              ),
                              md: GSStyle(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              sm: GSStyle(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              xs: GSStyle(
                                textStyle: TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                            ),
                            color: GSTheme.of(context).black,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    GSBox(
                      style: GSStyle(
                        lg: GSStyle(
                          height: 20,
                        ),
                        md: GSStyle(
                          height: 18,
                        ),
                        sm: GSStyle(
                          height: 18,
                        ),
                        xs: GSStyle(
                          height: 12,
                        ),
                      ),
                      child: FittedBox(
                        child: GSText(
                          text: item.offer,
                          style: GSStyle(
                            color: GSTheme.of(context).black,
                            textStyle: TextStyle(
                                fontSize: getResponsiveValue(
                                    context: context,
                                    xsValue: 8,
                                    smValue: 10,
                                    mdValue: 12,
                                    lgValue: 14,
                                    xlValue: 16),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
