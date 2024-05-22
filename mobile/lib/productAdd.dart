import 'package:flutter/material.dart';
import 'package:mobile/classOfProducts.dart';



class AddProducts extends StatefulWidget {
  final Function(ProductClass) onProductAdded;
  const AddProducts({Key? key, required this.onProductAdded}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController imgUrlController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBDC2BC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "New Product",
            style: TextStyle(
              fontSize: 58,
              color: Color.fromARGB(255, 68, 122, 155),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: "Product name",
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color.fromARGB(255, 68, 122, 155),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: TextField(
              controller: costController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Cost",
                labelStyle: TextStyle(color: Colors.white),
                fillColor:Color.fromARGB(255, 68, 122, 155),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: TextField(
              controller: imgUrlController,
              decoration: InputDecoration(
                labelText: "ImgUrl",
                labelStyle: TextStyle(color: Colors.white),
                fillColor:Color.fromARGB(255, 68, 122, 155),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: "Category",
                labelStyle: TextStyle(color: Colors.white),
                fillColor:Color.fromARGB(255, 68, 122, 155),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color:Color.fromARGB(255, 68, 122, 155),
            ),
            height: 60,
            alignment: Alignment.center,
            width: 200,
            child: TextButton(
              onPressed: () {
                if (productNameController.text.isEmpty ||
                    costController.text.isEmpty ||
                    imgUrlController.text.isEmpty ||
                    categoryController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Fill all fields'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  int parsedCost = double.parse(costController.text).toInt();
                  ProductClass newProduct = ProductClass(
                    name: productNameController.text,
                    cost: parsedCost,
                    category: categoryController.text,
                    imgUrl: imgUrlController.text,
                  );
                  widget.onProductAdded(newProduct);
                  productNameController.clear();
                  costController.clear();
                  categoryController.clear();
                  imgUrlController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}


