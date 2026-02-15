import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minicatalog_app/models/product_models.dart';

class ApiServices {
 static const baseUrl = "https://wantapi.com/products.php";

Future<ProductModels> fetchProducts () async {
final response = await http.get(Uri.parse(baseUrl));

if(response.statusCode == 200) {
  final data = jsonDecode(response.body);
  return ProductModels.fromJson(data);
}
else {
  throw Exception("API'ye erişimde hata oldu.");
}
}

}