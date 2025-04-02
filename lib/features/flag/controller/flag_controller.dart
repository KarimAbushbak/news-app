import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../routes/routes.dart';
import '../model/flag_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FlagController extends GetxController {
  List<CountryModel> allCountries = [];
  List<CountryModel> filteredCountries = [];
  bool isLoading = true;
  CountryModel? selectedCountry;

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  void fetchCountries() async {
    const url = 'https://restcountries.com/v3.1/all';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        allCountries = data.map((e) => CountryModel.fromJson(e)).toList();
        filteredCountries = allCountries;
      }
    } catch (e) {
      print('Error fetching countries: $e');
    }
    isLoading = false;
    update();
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries = allCountries;
    } else {
      filteredCountries = allCountries
          .where((c) => c.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  void selectCountry(CountryModel country) {
    selectedCountry = country;
    update();
  }


  void onNextPressed() async {
    final code = selectedCountry?.countryCode;
    if (code != null && code.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('country_code', code); // save the selected code
      Get.offNamed(Routes.topicView); // navigate to home
    }
  }
}
