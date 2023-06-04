import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_responsi_praktpm/models/model_newscategory.dart';

class NewsApi {
  static NewsApi instance = NewsApi();

  static Future<Map<String, dynamic>> getCategoryList(String category) async {
    final response = await http.get(Uri.parse("https://api-berita-indonesia.vercel.app/cnn/$category"));
    final body = response.body;

    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      return {"error": true};
    }
  }
}
