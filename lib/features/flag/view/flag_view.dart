import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/features/flag/controller/flag_controller.dart';

class FlagView extends StatelessWidget {
  const FlagView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlagController>(
      init: FlagController(),
      builder: (controller) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Select your Country'),
              centerTitle: true,
              leading: const BackButton(),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: controller.filterCountries,
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
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    itemCount: controller.filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = controller.filteredCountries[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          NetworkImage(country.flagUrl),
                        ),
                        title: Text(country.name),
                        onTap: () => controller.selectCountry(country),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: controller.selectedCountry != null
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
