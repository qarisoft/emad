import 'package:emad_app/ui/pages/customers/customers_index.dart';
import 'package:emad_app/ui/pages/home/home.dart';
import 'package:emad_app/ui/pages/orders/index.dart';
// import 'package:emad_app/ui/pages/orders/order_view.dart';
import 'package:emad_app/ui/pages/products/index.dart';
// import 'package:emad_app/ui/pages/products/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:toastification/toastification.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: const App(),
        ),
      ),
    );
  }
}
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // final PersistentTabController _controller = PersistentTabController(initialIndex: 0);


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      
       navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
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
            screen: OrderPage(),
            item: ItemConfig(
              icon: const Icon(CupertinoIcons.person_2_fill),
              title: "Messages",
            ),
          ),
          PersistentTabConfig(
            screen: CustomersPage(),
            item: ItemConfig(
              icon: const Icon(CupertinoIcons.arrow_right_arrow_left_square_fill),
              title: "Settings",
            ),
          ),
          PersistentTabConfig(
            screen: ProductsPage(),
            item: ItemConfig(
              icon: const Icon(CupertinoIcons.arrow_right_arrow_left_square_fill),
              title: "products",
            ),
          ),
        ],
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const OrderPage(),
      const CustomersPage(),
      const ProductsPage(),
      // const Page32()
    ];
  }

}