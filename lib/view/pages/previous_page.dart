import 'package:animate_do/animate_do.dart';
import 'package:app/components/poductsComponents/products_components.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/tab_bar_provider.dart';
import 'package:app/widgets/changeCategories/change_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviousPage extends StatefulWidget {
  const PreviousPage({Key? key}) : super(key: key);

  @override
  _PreviousPageState createState() => _PreviousPageState();
}

class _PreviousPageState extends State<PreviousPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 4, vsync: this);
    return ChangeNotifierProvider(
      create: (context) => TabBarProvider(),
      builder: (context, child) {
        return FadeInRight(
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    "Order online \ncollect in store",
                    style: TextStyle(
                        fontSize: 35,
                        color: ConstantsColors.iconThemeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TabBar(
                  unselectedLabelColor: ConstantsColors.iconThemeColor,
                  isScrollable: true,
                  labelColor: ConstantsColors.themeColor,
                  controller: _tabController,
                  labelPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  indicatorColor: ConstantsColors.themeColor,
                  tabs: const [
                    Tab(icon: Text("Wearable")),
                    Tab(icon: Text("Laptops")),
                    Tab(icon: Text("Phones")),
                    Tab(icon: Text("Drones")),
                  ],
                  onTap: (v) {
                    context.read<TabBarProvider>().changeIndex(v);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FadeInRightBig(
                          child: InkwelCategories(indexes: index),
                        );
                      },
                      itemCount: wearableNames.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

