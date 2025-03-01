
import '../../models/country_details_model.dart';

abstract class CountryDetailsState {}

class CountryDetailsInitial extends CountryDetailsState {}

class CountryDetailsLoading extends CountryDetailsState {}

class CountryDetailsLoaded extends CountryDetailsState {
  final CountryDetails countryDetails;
  CountryDetailsLoaded(this.countryDetails);
}

class CountryDetailsError extends CountryDetailsState {
  final String message;
  CountryDetailsError(this.message);
}
