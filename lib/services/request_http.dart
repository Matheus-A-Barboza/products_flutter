import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getProduct() async {
  var url = Uri.parse('https://dummyjson.com/products');
  var response = await http.get(url);
  
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['products'];
  } else {
    throw Exception('Falha ao carregar os produtos');
  }
}
