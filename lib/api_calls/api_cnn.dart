import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_responsi_praktpm/models/model_newscategory.dart';

class NewsApi {
  Future<NewsCategoryModel> getCategoryList(String category) async {
    var url = Uri.parse('https://api-berita-indonesia.vercel.app/cnn/$category');
    var response = await http.get(url);
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    return NewsCategoryModel.fromJson(data);
  }
}
