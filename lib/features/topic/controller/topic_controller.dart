import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/routes.dart';

class TopicController extends GetxController {
  // Available topics from UI
  final List<String> topics = [
    'National',
    'International',
    'Sport',
    'Lifestyle',
    'Business',
    'Health',
    'Fashion',
    'Technology',
    'Science',
    'Art',
    'Politics',
  ];

  // Selected topics by user
  final RxList<String> selectedTopics = <String>[].obs;

  // Mapping to NewsAPI categories
  final Map<String, String> topicToCategory = {
    'National': 'general',
    'International': 'general',
    'Sport': 'sports',
    'Lifestyle': 'entertainment',
    'Business': 'business',
    'Health': 'health',
    'Fashion': 'entertainment',
    'Technology': 'technology',
    'Science': 'science',
    'Art': 'entertainment',
    'Politics': 'general',
  };

  // Toggle selection
  void toggleTopic(String topic) {
    if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    } else {
      selectedTopics.add(topic);
    }
  }

  // Save selected category and navigate
  Future<void> onNextPressed() async {
    if (selectedTopics.isEmpty) {
      Get.snackbar("Error", "Please select at least one topic");
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    final selectedTopic = selectedTopics.first;
    final mappedCategory = topicToCategory[selectedTopic] ?? 'general';

    await prefs.setString('news_category', mappedCategory);

    Get.offNamed(Routes.homeView);
  }
}
