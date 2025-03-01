import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_service.dart';
import '../../repositories/country_repository.dart';
import 'country_details_event.dart';
import 'country_details_state.dart';

class CountryDetailsBloc extends Bloc<CountryDetailsEvent, CountryDetailsState> {


  CountryDetailsBloc() : super(CountryDetailsInitial()) {
    on<FetchCountryDetails>((event, emit) async {
      emit(CountryDetailsLoading());
      try {
        final apiService = ApiService();
        final CountryRepository countryRepository=CountryRepository(apiService: apiService);
        final country = await countryRepository.getCountryDetails(event.countryName);
        emit(CountryDetailsLoaded(country));
      } catch (e) {
        print("CountryError ${e}");
        emit(CountryDetailsError("Failed to load country details"));
      }
    });
  }
}
