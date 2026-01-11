import 'package:flutter/material.dart';
import 'package:flutter_practice/cart/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({super.key});

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  @override
  dispose() {
    _productNameController.dispose();
    _productPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CartProvider>();

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _productNameController,
            decoration: const InputDecoration(labelText: '商品名を記入してください'),
          ),
          TextField(
            controller: _productPriceController,
            decoration: const InputDecoration(labelText: '値段を記入してください'),
          ),
          ElevatedButton(
            onPressed: () => provider.addProduct(_productNameController.text, int.tryParse(_productPriceController.text) ?? 0),
            child: Text('追加する')
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.state.products.length,
              itemBuilder: (context, index) {
                final product = provider.state.products[index];

                return ListTile(
                  title: Text(product.name),
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => provider.removeProduct(product),
                  ),
                  trailing: Text(product.price.toString())
                );
              }
            )
          ),
          Row(
            children: [
              Checkbox(
                value: provider.state.isCouponApplied,
                onChanged: (_) => provider.toggleCoupon()
              ),
              Text('合計：${provider.state.totalPrice}円')
            ]
          )
        ]
      )
    );
  }
}