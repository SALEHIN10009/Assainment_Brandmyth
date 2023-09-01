import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/products_model.dart';
import 'details_page.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  Future<Product?>? product;

  //dataFetch korar jonno MAP create (START)....

  Map<String, dynamic>? productMap;
  Map<String, dynamic>? singleProductMap;
  fetchData() async {
    String productAPI =
        "https://uol-v-2.hostprohub.com/api/get-products?platform=app";
    String singleProductAPI =
        "https://uol-v-2.hostprohub.com/api/get-product/12";

    var productResponse = await http.get(Uri.parse(productAPI));

    print(productResponse.body);
    var singleProductResponse = await http.get(Uri.parse(singleProductAPI));

    setState(() {
      productMap = Map<String, dynamic>.from(jsonDecode(productResponse.body));
      singleProductMap =
          Map<String, dynamic>.from(jsonDecode(singleProductResponse.body));
    });
  }

  Future getProductList() async {
    try {
      String url =
          "https://uol-v-2.hostprohub.com/api/get-products?platform=app";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Data Loading Error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // int product = 8;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPage(),
        ));
      },
      child: Hero(
        tag: 'imageHero',
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: FutureBuilder(
            future: getProductList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List product = snapshot.data['data']['data'];
                return GridView.builder(
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(product[index]["image"]["large"]
                              //!=null? const AssetImage("assets/images/i.png"):

                              ),
                          Text(
                            product[index]["name"],
                          ),
                        ],
                      ),
                    );

                    // product[index]["name"].toString() != null
                    //     ? Image.network(
                    //         "https://uol-v-2.hostprohub.com/api/get-products?platform=app" +
                    //             product[index]["image"]["large"].toString())
                    //     : Image.asset("assets/images/i.png"));
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF08a180),
                ),
              );
            },
          ),
          // child: GridView.builder(
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //     itemCount: productMap?.length,
          //     itemBuilder: (_, index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(12.0),
          //         child: Card(
          //           child: Column(
          //             children: [
          //               productMap == null
          //                   ? Center(child: CircularProgressIndicator())
          //                   : Text(
          //                       productMap!["data"][index]["name"],
          //                     ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }),
        ),
      ),
    );
  }
}
