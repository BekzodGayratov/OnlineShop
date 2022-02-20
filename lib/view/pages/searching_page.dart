import 'package:animate_do/animate_do.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/functions/searched_items.function.dart';
import 'package:app/providers/search_bar_provider.dart';
import 'package:app/widgets/searched_items.dart';
import 'package:app/widgets/searching_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchingPage extends StatelessWidget {
  const SearchingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBarProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: ConstantsColors.lightModeColor,
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            iconTheme: IconThemeData(color: ConstantsColors.iconThemeColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const SearchingButton(),
          ),
          body: FadeInUp(
            child: Column(
              children: [
                itemFoundStatus(context) ??
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent:
                                      MediaQuery.of(context).size.height *
                                          0.35),
                          itemBuilder: (context, index) {
                            return FoundItems(
                              index: index,
                            );
                          },
                          itemCount: context
                              .watch<SearchBarProvider>()
                              .searchedItems
                              .length),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
