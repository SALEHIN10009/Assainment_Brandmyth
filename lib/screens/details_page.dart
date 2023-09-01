import 'dart:convert';

import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to Cart"),
      ),
      body: Hero(
        tag: 'imageHero',
        child: FutureBuilder(
          future: getProductList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List product = snapshot.data['data']['data'];
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                        product[index]["image"]["large"]
                                        //!=null? const AssetImage("assets/images/i.png"):

                                        ),
                                  ),
                                ),
                                Text(
                                  product[index]["name"],
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Price : " +
                                      product[index]
                                          ["formatted_final_product_price"],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Total Items : "),
                          Row(
                            children: [
                              CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    _incrementCounter();
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text("$_counter"),
                              SizedBox(
                                width: 6,
                              ),
                              CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    _decrementCounter();
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Total Price : "),
                        ],
                      )
                    ],
                  );
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
      ),
    );
  }
}
