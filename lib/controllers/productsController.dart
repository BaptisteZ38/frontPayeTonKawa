import 'dart:convert';
import 'package:front_paye_ton_kawa/models/products.dart';
import 'package:http/http.dart' as http;

class ProductsController {
  Future<List<Products>> getAllProducts() async {
    String urlString = 'http://192.168.29.125:8080/api/v1/products';
    final response = await http.get(Uri.parse(urlString));
    if (response.statusCode == 200) {
      // La requête a réussi
      var products = <Products>[];
      for (var product in json.decode(response.body)) {
        products.add(Products.fromJson(product));
      }
      return products;
    } else {
      // La requête a échoué
      throw Exception(
          "La requête a échoué avec le code d'erreur: ${response.statusCode}");
    }
  }

   Future<Products> getProductsById(final String id_product) async {
    String urlString = 'http://192.168.29.125:8080/api/v1/products/${id_product}';
    final response = await http.get(Uri.parse(urlString));
    if (response.statusCode == 200) {
      // La requête a réussi
      var product = json.decode(response.body);
      var products = Products.fromJson(product);
      return products;
    } else {
      // La requête a échoué
      throw Exception(
          "La requête a échoué avec le code d'erreur: ${response.statusCode}");
    }
  }
}