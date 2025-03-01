
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryInfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isLink;
  final String? link;

  const CountryInfoTile({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    this.isLink = false,
    this.link,
  }) : super(key: key);

  void _launchURL(BuildContext context) async {
    if (link != null && await canLaunchUrl(Uri.parse(link!))) {
      await launchUrl(Uri.parse(link!));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: isLink
          ? GestureDetector(
        onTap: () => _launchURL(context),
        child: Text(
          value,
          style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
        ),
      )
          : Text(value),
    );
  }
}
