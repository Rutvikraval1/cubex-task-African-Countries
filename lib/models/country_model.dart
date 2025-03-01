class Country {
  final String name;
  final String capital;
  final String flag;
  final Map<String, dynamic> languages;

  Country({required this.name, required this.capital, required this.flag, required this.languages});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      capital: (json['capital'] as List<dynamic>?)?.first ?? 'N/A',
      flag: json['flags']['png'],
      languages: json['languages'] ?? {},
    );
  }
}