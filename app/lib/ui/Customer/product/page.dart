import 'package:flutter/material.dart';
import 'package:farm_link_ai/consts/assets.dart' as consts;

class CustomerProduct extends StatefulWidget {
  const CustomerProduct({super.key});

  @override
  State<CustomerProduct> createState() => _CustomerProductState();
}

class _CustomerProductState extends State<CustomerProduct> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  // Static products data
  final List<Product> staticProducts = [
    Product(
      title: "Honey and Olive Oil Mask",
      price: 15.0,
      picture:
         consts.img1, // Use a static image file name
    ),
    Product(
      title: "Aloe Vera Gel",
      price: 20.0,
      picture: consts.img7, // Use a static image file name
    ),
    Product(
      title: "Cucumber and Yogurt Mask",
      price: 18.0,
      picture:
         consts.img9, // Use a static image file name
    ),
    Product(
      title: "Rose Water Toner",
      price: 12.0,
      picture: consts.img4, // Use a static image file name
    ),
    Product(
      title: "Lemon and Honey Face Pack",
      price: 10.0,
      picture:
          consts.img22, // Use a static image file name
    ),
    Product(
      title: "Aloe Vera and Tea Tree Oil Mask",
      price: 22.0,
      picture:
          consts.img24, // Use a static image file name
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = staticProducts
        .where((product) =>
            product.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Products"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(consts.navbarImage),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Our Products",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Our Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xFFEDDD5E),
                    ),
                  ),
                  Text(
                    "Our Products For Healthy Living",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF404A3D),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search products by title here",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(width: 1),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductItem(product: product);
                },
              ),
            ),
            if (filteredProducts.isEmpty) // Show message when no products match
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "No products found.",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                product.picture, // Use the static image path
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "₹${product.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Static Product model
class Product {
  final String title;
  final double price;
  final String picture;

  Product({required this.title, required this.price, required this.picture});
}
