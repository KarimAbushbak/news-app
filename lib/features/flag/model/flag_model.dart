class CountryModel {
  final String name;
  final String flagUrl;
  final String countryCode;

  CountryModel({
    required this.name,
    required this.flagUrl,
    required this.countryCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'] ?? '',
      flagUrl: json['flags']['png'] ?? '',
      countryCode: json['cca2']?.toLowerCase() ?? '',
    );
  }
}
