import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(color: GSTheme.of(context).background100),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getResponsiveValue(
                  context: context,
                  xsValue: 20,
                  smValue: 30,
                  mdValue: 40,
                  lgValue: 50) ??
              50,
          horizontal: getResponsiveValue(
                  context: context,
                  xsValue: 10,
                  smValue: 20,
                  mdValue: 30,
                  lgValue: 40) ??
              40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: _buildColumnSection(
                    title: "ONLINE SHOPPING",
                    items: [
                      "Men",
                      "Women",
                      "Kids",
                      "Home & Living",
                      "Beauty",
                      "Gift Cards",
                      "Myntra Insider"
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: _buildColumnSection(
                    title: "CUSTOMER POLICIES",
                    items: [
                      "Contact Us",
                      "FAQ",
                      "T&C",
                      "Terms Of Use",
                      "Track Orders",
                      "Shipping",
                      "Cancellation",
                      "Returns",
                      "Privacy policy",
                      "Grievance Officer",
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GSText(
                        text: "EXPERIENCE MYNTRA APP ON MOBILE",
                        style: GSStyle(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getResponsiveValue(
                                    context: context,
                                    xsValue: 11,
                                    smValue: 13,
                                    mdValue: 14,
                                    lgValue: 15) ??
                                15,
                            color: Color(0xFF3E4152),
                          ),
                        ),
                      ),
                      GSBox(
                        style: GSStyle(height: 10),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FittedBox(
                                child: GSImage(
                                  path: 'assets/images/google.png',
                                  imageType: GSImageType.asset,
                                  style: GSStyle(
                                    width: getResponsiveValue(
                                            context: context,
                                            xsValue: 40,
                                            smValue: 60,
                                            mdValue: 80,
                                            lgValue: 100,
                                            xlValue: 120) ??
                                        120,
                                    height: 30,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            GSBox(
                              style: GSStyle(width: 10),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FittedBox(
                                child: GSImage(
                                  path: 'assets/images/apple.png',
                                  imageType: GSImageType.asset,
                                  style: GSStyle(
                                    width: getResponsiveValue(
                                            context: context,
                                            xsValue: 40,
                                            smValue: 60,
                                            mdValue: 80,
                                            lgValue: 100,
                                            xlValue: 120) ??
                                        120,
                                    height: 30,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GSBox(
                        style: GSStyle(height: 20),
                      ),
                      GSText(
                        text: "KEEP IN TOUCH",
                        style: GSStyle(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getResponsiveValue(
                                    context: context,
                                    xsValue: 11,
                                    smValue: 13,
                                    mdValue: 14,
                                    lgValue: 15) ??
                                15,
                            color: Color(0xFF3E4152),
                          ),
                        ),
                      ),
                      GSBox(
                        style: GSStyle(height: 10),
                      ),
                      Row(
                        children: [
                          _buildSocialIcon(Icons.facebook_outlined),
                          _buildSocialIcon(Icons.facebook_outlined),
                          _buildSocialIcon(Icons.facebook_outlined),
                          _buildSocialIcon(Icons.facebook_outlined),

                          // _buildSocialIcon(Icons.twitter_outlined),
                          // _buildSocialIcon(Icons.instagram_outlined),
                          // _buildSocialIcon(Icons.youtube_outlined),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFeature(
                        text:
                            "100% ORIGINAL guarantee for all products at myntra.com",
                      ),
                      GSBox(
                        style: GSStyle(height: 20),
                      ),
                      _buildFeature(
                        text: "Return within 14 days of receiving your order",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GSBox(style: GSStyle(height: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildColumnSection(
      {required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSText(
            maxLines: 7,
            text: title,
            style: GSStyle(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF3E4152),
              ),
            )),
        GSBox(style: GSStyle(height: 10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: GSText(
                  maxLines: 7,
                  text: item,
                  style: GSStyle(
                    textStyle: TextStyle(
                      color: Color(0xFF7E818C),
                      fontSize: 14,
                    ),
                  )),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GSIcon(
        icon: icon,
        size: GSIconSizes.$xl,
      ),
    );
  }

  Widget _buildFeature({String? iconPath, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (iconPath != null)
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        if (iconPath != null)
          GSBox(
            style: GSStyle(
              width: 10,
            ),
          ),
        Expanded(
          child: GSText(
              text: text,
              maxLines: 5,
              style: GSStyle(
                textStyle: TextStyle(
                  color: Color(0xFF7E818C),
                  fontSize: 14,
                ),
              )),
        ),
      ],
    );
  }
}
