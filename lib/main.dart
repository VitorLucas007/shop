import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/products_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.orange,
          ),
          fontFamily: 'Lato',
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        // home: ProducstOverviewPage(),
        routes: {
          AppRoutes.home: (context) => ProducstOverviewPage(),
          AppRoutes.productDetail: (context) => ProductsDetailPage(),
          AppRoutes.cart: (context) => CartPage(),
          AppRoutes.orders: (context) => OrdersPage(),
          
        },
      ),
    );
  }
}
