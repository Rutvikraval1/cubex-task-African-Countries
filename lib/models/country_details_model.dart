
import 'dart:convert';

class CountryDetails {
  final String name;
  final String officialName;
  final List<String> capital;
  final String flag;
  final String region;
  final String subregion;
  final Map<String, String> languages;
  final int population;
  final double area;
  final String googleMaps;
  final String coatOfArms;
  final String timezone;
  final List<String> borders;
  final String currency;
  final String currencySymbol;
  final String? message;

  CountryDetails({
    required this.name,
    required this.officialName,
    required this.capital,
    required this.flag,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.population,
    required this.area,
    required this.googleMaps,
    required this.coatOfArms,
    required this.timezone,
    required this.borders,
    required this.currency,
    required this.currencySymbol,
     this.message,
  });

  factory CountryDetails.fromJson(Map<String, dynamic> json) {
    return CountryDetails(
      name: json['name']['common'] ?? '',
      officialName: json['name']['official'] ?? '',
      capital: List<String>.from(json['capital'] ?? []),
      flag: json['flags']['png'] ?? '',
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      languages: json['languages'] != null
          ? Map<String, String>.from(json['languages'])
          : {},
      population: json['population'] ?? 0,
      area: (json['area'] ?? 0).toDouble(),
      googleMaps: json['maps']['googleMaps'] ?? '',
      coatOfArms: json['coatOfArms']['png'] ?? '',
      timezone: json['timezones'] != null ? json['timezones'][0] : '',
      borders: json['borders'] != null ? List<String>.from(json['borders']) : [],
      currency: json['currencies'] != null ? json['currencies'].keys.first : '',
      message: json['message']??'',
      currencySymbol: json['currencies'] != null
          ? json['currencies'][json['currencies'].keys.first]['symbol']
          : '',
    );
  }
}