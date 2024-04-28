import 'package:flutter/material.dart';
import 'package:my_app/product_model.dart';
import 'package:my_app/widget/produc_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameProductControlar = TextEditingController();
  TextEditingController selPriceControlar = TextEditingController();
  TextEditingController buyingPriceControlar = TextEditingController();
  List products = [
    ProductModel(productName: 'اسم المنتج', sellPrice: 0.0, buyingPrice: 0.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Progect"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Product(
                productModel: products[index],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("ادخل المنتجات "),
                titleTextStyle: const TextStyle(fontSize: 30),
                titlePadding: const EdgeInsets.only(left: 50.0),
                backgroundColor: Colors.grey[200],
                actions: [
                  Container(
                    height: 250,
                    child: Column(
                      children: [
                        TextField(
                          controller: nameProductControlar,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'اسم النتج',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        Spacer(),
                        TextField(
                          controller: selPriceControlar,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'سعر الشراء',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextField(
                          controller: buyingPriceControlar,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'سعر المبيع ',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          double convertSell =
                              double.parse(selPriceControlar.text);
                          double convertBuying =
                              double.parse(buyingPriceControlar.text);
                          products.add(
                            ProductModel(
                                productName: nameProductControlar.text,
                                sellPrice: convertSell,
                                buyingPrice: convertBuying),
                          );
                          Navigator.pop(context);
                          nameProductControlar.clear();
                          selPriceControlar.clear();
                          buyingPriceControlar.clear();
                          setState(() {});
                        },
                        child: const Text("اضافة"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          nameProductControlar.clear();
                          selPriceControlar.clear();
                          buyingPriceControlar.clear();
                        },
                        child: const Text("الغاء"),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Colors.blueAccent,
        focusColor: Colors.red,
      ),
    );
  }
}
