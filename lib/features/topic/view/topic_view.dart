import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/topic_controller.dart';

class TopicView extends StatelessWidget {
  const TopicView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicController>(
      init: TopicController(),
      builder: (controller) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Choose your Topics'),
              centerTitle: true,
              leading: const BackButton(),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: controller.filterTopics,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.filteredTopics.map((topic) {
                        final isSelected = controller.selectedTopics.contains(topic);
                        return ChoiceChip(
                          label: Text(topic),
                          selected: isSelected,
                          selectedColor: Colors.blue,
                          onSelected: (_) => controller.toggleTopic(topic),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.blue,
                          ),
                          side: const BorderSide(color: Colors.blue),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: controller.selectedTopics.isNotEmpty
                          ? () => controller.onNextPressed()
                          : null,
                      child: const Text('Next'),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
