import 'package:get/get.dart';

class TopicController extends GetxController {
  final List<String> allTopics = [
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
    'Politics'
  ];

  List<String> filteredTopics = [];
  List<String> selectedTopics = [];

  @override
  void onInit() {
    super.onInit();
    filteredTopics = List.from(allTopics);
  }

  void filterTopics(String query) {
    if (query.isEmpty) {
      filteredTopics = List.from(allTopics);
    } else {
      filteredTopics = allTopics
          .where((topic) => topic.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  void toggleTopic(String topic) {
    if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    } else {
      selectedTopics.add(topic);
    }
    update();
  }

  void onNextPressed() {
    print('Selected topics: $selectedTopics');
    // Navigate to next screen or save selection
  }
}
