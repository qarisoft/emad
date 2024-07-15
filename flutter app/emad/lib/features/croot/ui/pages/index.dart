import 'package:emad/features/croot/ui/pages/customers.dart';
import 'package:emad/features/croot/ui/pages/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'home.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key, required this.title});

  final String title;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        // backgroundColor: Colors.red,
        // backgroundColor: Colors.grey,

      
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(

          navBarConfig: navBarConfig.copyWith(),
        ),
        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(
              icon: Icon(Icons.home),
              title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: ProductsPage(),
            item: ItemConfig(
              icon: const Icon(CupertinoIcons.arrow_up_doc_fill),
              title: "products",
            ),
          ),
          PersistentTabConfig(
            screen: CustomersPage(),
            item: ItemConfig(
              icon: const Icon(CupertinoIcons.arrow_up_doc_fill),
              title: "customers",
            ),
          ),

          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(
              icon: const Icon(CupertinoIcons.arrow_right_arrow_left_square_fill),
              title: "Settings",
            ),
          ),
        ],
      ),
    );
  }
}
