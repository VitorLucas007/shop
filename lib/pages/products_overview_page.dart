import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/badgee.dart';

import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions { favorite, all }

class ProducstOverviewPage extends StatefulWidget {
  const ProducstOverviewPage({super.key});

  @override
  State<ProducstOverviewPage> createState() => _ProducstOverviewPageState();
}

class _ProducstOverviewPageState extends State<ProducstOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            itemBuilder:
                (_) => [
                  PopupMenuItem(
                    value: FilterOptions.favorite,
                    child: Text('Somente Favoritos'),
                  ),
                  PopupMenuItem(value: FilterOptions.all, child: Text('Todos')),
                ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder:
                (context, cart, child) =>
                    Badgee(value: cart.itemsCount.toString(), child: child!),
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
      drawer: AppDrawer(),
    );
  }
}
