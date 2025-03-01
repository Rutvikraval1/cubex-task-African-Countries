import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country/country_bloc.dart';
import '../bloc/country/country_state.dart';
import '../widgets/country_card.dart';
import 'country_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('African Countries')),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountryLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryDetailScreen(countryName: country.name),
                      ),
                    );
                  },
                  child: CountryCard(country: country),
                );
              },
            );
          } else {
            print("state :${state.runtimeType}");
            return const Center(child: Text('Error loading countries'));
          }
        },
      ),
    );
  }
}
