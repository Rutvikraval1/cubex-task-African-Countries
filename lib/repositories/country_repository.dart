import '../core/network/api_service.dart';
import '../models/country_details_model.dart';
import '../models/country_model.dart';

class CountryRepository {
  final ApiService apiService;
  CountryRepository({required this.apiService});

  Future<List<Country>> getCountries() => apiService.fetchCountries();
  Future<CountryDetails> getCountryDetails(String name) => apiService.fetchCountryDetails(name);
}