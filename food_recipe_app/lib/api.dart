import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<List<dynamic>> fetchMeals() async {
    final response = await http.get(
      Uri.parse('${baseUrl}filter.php?c=Seafood/images/media/meals/llcbn01574260722.jpg/preview'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
