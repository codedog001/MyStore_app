import '../providers/product.dart';
import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; //gives the id.
    final loadedProduct = Provider.of<Products>(
      context,
      listen:
          false, //when listen is false, the build method won't run every time when the Products is updated. This is done when we are interested in getting data only one time, but not intersted in updating  it.
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
