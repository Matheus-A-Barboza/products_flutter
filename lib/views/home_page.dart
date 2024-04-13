import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/request_http.dart';
import 'package:flutter_application_2/views/detail_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: FutureBuilder(
        future: futureProducts,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                var product = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProduct(
                            images: product['images'][0],  // Acessando o primeiro item da lista 'images'
                            title: product['title'],
                            description: product['description'],
                            price: product['price'],
                            brand: product['brand'],
                            category: product['category'],
                          ),
                        ),
                      );
                    },

                    child: Card(
                      elevation: 10,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Image.network(
                            '${product['thumbnail']}',
                            width: 300,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 12),
                          Text('${product['title']}'),
                          Text('\$${product['price']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
