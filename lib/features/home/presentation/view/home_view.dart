import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/features/home/presentation/controller/home_controller.dart';

class HomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Top Headlines"),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: controller.fetchNews,
              ),
            ],
          ),
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.articles.isEmpty) {
              return const Center(child: Text("No news available"));
            }

            return RefreshIndicator(
              onRefresh: controller.fetchNews,
              child: ListView.builder(
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  final article = controller.articles[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: article['urlToImage'] != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          article['urlToImage'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      )
                          : const Icon(Icons.image_not_supported),
                      title: Text(article['title'] ?? "No title"),
                      subtitle: Text(article['source']['name'] ?? "Unknown source"),
                      onTap: () {
                      },
                    ),
                  );
                },
              ),
            );
          }),
        );
      }
    );
  }
}
