import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/country_details_model.dart';
import '../constants/api_endpoints.dart';
import '../../models/country_model.dart';

class ApiService {
  Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse(africaCountries));
    print("response : ${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("response-data : ${data}");
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<CountryDetails> fetchCountryDetails(String name) async {
    final response = await http.get(Uri.parse('$countryDetails$name'));
    print("response : ${response.statusCode}");
    print("Uri Details : ${Uri.parse('$countryDetails$name')}");
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("response-data : ${data}");
      return CountryDetails.fromJson(data.first);
    } else {
      throw Exception('Failed to load country details');
    }
  }
}
