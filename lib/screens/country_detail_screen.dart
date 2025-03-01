import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country/country_bloc.dart';
import '../bloc/country/country_state.dart';
import '../bloc/country_details/country_details_bloc.dart';
import '../bloc/country_details/country_details_event.dart';
import '../bloc/country_details/country_details_state.dart';
import '../models/country_model.dart';
import '../widgets/CountryInfoTile.dart';

class CountryDetailScreen extends StatelessWidget {
  final String countryName; // Use country name instead of full object

  const CountryDetailScreen({Key? key, required this.countryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryDetailsBloc()..add(FetchCountryDetails(countryName)),
      child: Scaffold(
        appBar: AppBar(title: Text(countryName)),
        body: BlocBuilder<CountryDetailsBloc, CountryDetailsState>(
          builder: (context, state) {
            if (state is CountryDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CountryDetailsLoaded) {
              final country = state.countryDetails;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Country Flag
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        country.flag,
                        width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Country Info
                    Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          CountryInfoTile(label: 'Official Name', value: country.officialName, icon: Icons.language),
                          CountryInfoTile(label: 'Capital', value: country.capital.isNotEmpty ? country.capital.join(", ") : 'N/A', icon: Icons.location_city),
                          CountryInfoTile(label: 'Region', value: country.region, icon: Icons.public),
                          CountryInfoTile(label: 'Subregion', value: country.subregion, icon: Icons.map),
                          CountryInfoTile(label: 'Languages', value: country.languages.values.join(", "), icon: Icons.translate),
                          CountryInfoTile(label: 'Population', value: country.population.toString(), icon: Icons.people),
                          CountryInfoTile(label: 'Area', value: '${country.area} km²', icon: Icons.terrain),
                          CountryInfoTile(label: 'Google Maps', value: 'View on Maps', icon: Icons.map, isLink: true, link: country.googleMaps),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is CountryDetailsError) {
              return Center(child: Text("Error: ${state.message}", style: TextStyle(color: Colors.red)));
            }
            return const Center(child: Text("No Data Available"));
          },
        ),
      ),
    );
  }
}
