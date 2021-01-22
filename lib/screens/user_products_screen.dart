import 'package:MyStore_app/screens/edit_product_screen.dart';
import 'package:MyStore_app/widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product-screen';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductItem(productsData.items[i].imageUrl,
                  productsData.items[i].title, productsData.items[i].id),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
