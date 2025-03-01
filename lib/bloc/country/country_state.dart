import '../../models/country_details_model.dart';
import '../../models/country_model.dart';

abstract class CountryState {}
class CountryLoading extends CountryState {}
class CountryLoaded extends CountryState {
  final List<Country> countries;
  CountryLoaded(this.countries);
}
class CountryDetailLoaded extends CountryState {
  final CountryDetails countryDetails;
  CountryDetailLoaded(this.countryDetails);
}



class CountryError extends CountryState {}
