import 'package:flutter/material.dart';
// import 'package:flutter_application_2/views/test_view.dart';

class DetailProduct extends StatefulWidget {
  final String images;
  final String title;
  final String description;
  final int price;
  final String brand;
  final String category;

  DetailProduct({
    required this.images,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.category,
  });

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.images,
                width: double.infinity, // Preencher toda a largura
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                widget.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Preço: \$${widget.price.toString()}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                widget.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Marca: ${widget.brand}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Categoria: ${widget.category}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
