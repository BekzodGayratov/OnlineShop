import 'package:app/constants/constants_colors.dart';
import 'package:app/functions/disable_search_field.dart';
import 'package:app/providers/bottom_navigation_provider.dart';
import 'package:app/providers/search_bar_provider.dart';
import 'package:app/providers/tab_bar_provider.dart';
import 'package:app/view/pages/previous_page.dart';
import 'package:app/view/pages/searching_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List pages = [
      PreviousPage(),
      SearchingPage(),
      PreviousPage(),
      PreviousPage(),
      SearchingPage(),
    ];
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationProvider(),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => BottomNavigationProvider()),
            ChangeNotifierProvider(create: (context) => TabBarProvider()),
            ChangeNotifierProvider(create: (context) => SearchBarProvider()),
          ],
          builder: (context, child) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ConstantsColors.lightModeColor,
              drawer: Column(),
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.1,
                iconTheme: IconThemeData(color: ConstantsColors.iconThemeColor),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: disableSearchField(context),
              ),
              body:
                  pages[context.watch<BottomNavigationProvider>().currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.transparent,
                selectedItemColor: ConstantsColors.themeColor,
                unselectedItemColor: ConstantsColors.iconThemeColor,
                currentIndex:
                    context.watch<BottomNavigationProvider>().currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined), label: ""),
                ],
                onTap: (v) {
                  FocusScope.of(context).unfocus();
                  context.read<BottomNavigationProvider>().changePages(v);
                  context.read<SearchBarProvider>().clearController();
                },
              ),
            );
          },
        );
      },
    );
  }
}
