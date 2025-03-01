abstract class CountryDetailsEvent {}

class FetchCountryDetails extends CountryDetailsEvent {
  final String countryName;
  FetchCountryDetails(this.countryName);
}
