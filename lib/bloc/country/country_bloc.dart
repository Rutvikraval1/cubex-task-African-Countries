import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_service.dart';
import '../../repositories/country_repository.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryLoading()) {
    on<FetchCountries>((event, emit) async {
      try {
        final apiService = ApiService();
        final CountryRepository countryRepository=CountryRepository(apiService: apiService);
        final countries = await countryRepository.getCountries();
        emit(CountryLoaded(countries));
      } catch (_) {
        print("CountryError ${_}");
        emit(CountryError());
      }
    });
  }
}