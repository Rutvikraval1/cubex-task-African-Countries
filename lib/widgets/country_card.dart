import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(country.flag, width: 50, height: 50),
        title: Text(country.name),
        subtitle: Text('Capital: ${country.capital}'),
      ),
    );
  }
}