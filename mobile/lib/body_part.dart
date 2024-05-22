import 'package:flutter/material.dart';
import 'package:mobile/classOfProducts.dart';
import 'package:mobile/login.dart';
import 'package:mobile/productAdd.dart';

class BodyPart extends StatefulWidget {
  const BodyPart({Key? key}) : super(key: key);

  @override
  _BodyPartState createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  static bool isVerified = false;

  List<ProductClass> productsList = [
    ProductClass(
      name: "Asus RYZEN  Core-i7 13-gen",
      cost:206000,
      category: "Electronics",
      imgUrl: "lib/images/img1.jpg",
    ),
    ProductClass(
      name: "Asus RYZEN  Core-i7 13-gen",
      cost: 20000,
      category: "Electronics",
      imgUrl: "lib/images/img2.jpg",
    ),
    ProductClass(
      name: "New Japanese T-shirts",
      cost: 102000,
      category: "Clothes",
      imgUrl: "lib/images/img3.webp",
    ),
    ProductClass(
      name: "New Japanese T-shirts",
      cost: 80000,
      category: "Clothes",
      imgUrl: "lib/images/img4.jpg",
    ),
    ProductClass(
      name: "Asus RYZEN  Core-i7 13-gen",
      cost: 10700,
      category: "Electronics",
      imgUrl: "lib/images/img2.jpg",
    ),
    ProductClass(
      name: "New Futuristic sport Cloth",
      cost: 10700,
      category: "Sport",
      imgUrl: "lib/images/img5.jpg",
    ),
  ];

  Map<String, bool> categorySelection = {
    "Electronics": false,
    "Clothes": false,
    "Sport": false,
    "Phone": false,
    "Home Tech": false,
  };

  List<String> categories = [
     "Electronics",
    "Clothes",
    "Sport",
    "Phone",
    "Home Tech",
    
  ];

  List<ProductClass> getFilteredProducts() {
    if (categorySelection.values.every((selected) => !selected)) {
      return List.from(productsList);
    }

    return productsList
        .where((product) => categorySelection[product.category] == true)
        .toList();
  }

  List<ProductClass> getSearchedProducts(String searchText) {
    return productsList
        .where((product) =>
            product.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  String searchText = '';
  bool ascending = true;

  void sortProductsByPrice() {
    setState(() {
      productsList.sort((a, b) =>
          ascending ? a.cost.compareTo(b.cost) : b.cost.compareTo(a.cost));
      ascending = !ascending;
    });
  }

  void addProduct(ProductClass product) {
    setState(() {
      productsList.insert(0, product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(23, 47, 82, 196),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          buildHeader(),
          SizedBox(height: 20),
          buildCategorySection(),
          SizedBox(height: 28),
          buildProductsHeader(),
          buildProductsList(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      decoration: BoxDecoration(
        
        color:  Color.fromARGB(23, 47, 82, 196),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(23, 47, 82, 196),
            width: 10,
          ),
        ),
      ),
      height: 97,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSearchField(),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              if (isVerified) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProducts(
                      onProductAdded: addProduct,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      onSuccess: () {
                        isVerified = true;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProducts(
                              onProductAdded: addProduct,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 55,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromARGB(22, 59, 91, 197),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Add Product",
                  style: TextStyle(
                    color: Color.fromARGB(255, 64, 190, 212),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 280,
        child: TextField(
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
          decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(color: Colors.white),
            fillColor: Color.fromARGB(255, 68, 122, 155),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "",
            style: TextStyle(
              color: Color.fromARGB(255, 78, 85, 187),
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 17),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              children: [
                for (int i = 0; i < categories.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        categorySelection[categories[i]] =
                            !categorySelection[categories[i]]!;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: categories[i] == "Entertainment" ? 180 : 120,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: categorySelection[categories[i]] ?? false
                            ? Color.fromARGB(255, 11, 76, 117)
                            : Color.fromARGB(255, 59, 130, 181),
                      ),
                      child: Text(
                        categories[i],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductsHeader() {
    return Padding(
      padding: const EdgeInsets.only(right: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Products",
              style: TextStyle(
                color: Color(0xFF265614),
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 54, 206, 206)),
            ),
            onPressed: () {
              sortProductsByPrice();
            },
            child: Text(
              "Sort",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

Widget buildProductsList() {
  final products = searchText.isEmpty
      ? getFilteredProducts()
      : getSearchedProducts(searchText);
  return Expanded(
    child: ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjust vertical padding
          child: Card(
            color: Color.fromARGB(255, 68, 170, 162),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                // Navigate to product details page or any other action
              },
              child: Container(
                height: 200, // Adjust card height for larger images
                padding: EdgeInsets.all(12), // Add padding inside the card
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        product.imgUrl,
                        height: 180, // Adjust image height
                        width: 140, // Adjust image width
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12), // Add spacing between the image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2, // Adjust maximum lines for title
                            overflow: TextOverflow.ellipsis, // Handle overflow
                          ),
                          SizedBox(height: 6), // Add spacing between title and subtitle
                          Text(
                            product.category,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6), // Add spacing between subtitle and price
                          Text(
                            '\$${product.cost}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
}