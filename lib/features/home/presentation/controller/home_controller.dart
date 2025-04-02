import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final RxList articles = [].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final country = prefs.getString('country_code') ?? 'us';
    final category = prefs.getString('news_category') ?? 'general';

    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?'
          'country=$country&'
          'category=$category&'
          'apiKey=284f2974ce7b4fe49467407482a3bcb5', // replace with env if needed
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        articles.value = data['articles'];
      } else {
        Get.snackbar('Error', 'Failed to fetch news: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
