class CountryModel {
  final String name;
  final String flagUrl;

  CountryModel({required this.name, required this.flagUrl});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'] ?? '',
      flagUrl: json['flags']['png'] ?? '',
    );
  }
}
