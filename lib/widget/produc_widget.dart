import 'package:flutter/material.dart';
import 'package:my_app/product_model.dart';

class Product extends StatelessWidget {
  final ProductModel productModel;
  const Product({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$${productModel.sellPrice.toString()}  : الشراء",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "\$${productModel.buyingPrice.toString()} :المبيع",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Text(
                    productModel.productName.toString(),
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      print(" edit");
                    },
                    icon: const Icon(Icons.edit),
                    iconSize: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      print(" delete");
                    },
                    icon: const Icon(Icons.delete),
                    iconSize: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
