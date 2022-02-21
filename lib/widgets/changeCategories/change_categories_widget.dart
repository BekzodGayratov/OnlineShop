import 'package:app/constants/constants_colors.dart';
import 'package:app/functions/products_categories.dart';
import 'package:app/providers/tab_bar_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InkwelCategories extends StatelessWidget {
  int? indexes;
  InkwelCategories({Key? key, required this.indexes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.075,
                bottom: MediaQuery.of(context).size.height * 0.01),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: ConstantsColors.themeColorSecond,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.02)),
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: Column(
                children: [
                  Text(
                    productsName(
                        context.watch<TabBarProvider>().tabindex)[indexes!],
                    style: TextStyle(
                        color: ConstantsColors.iconThemeColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.008,
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    child: Text(
                      "Series 6. Red",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    "\$359",
                    style: TextStyle(
                        color: ConstantsColors.themeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.128,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.17,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      productsImage(
                          context.watch<TabBarProvider>().tabindex)[indexes!],
                    ),
                  ),
                  shape: BoxShape.circle),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/indivudial', arguments: ["Apple iPod"]);
      },
    );
  }
}
