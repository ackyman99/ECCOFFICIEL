import 'package:flutter/material.dart';
import '../../../models/cantique.dart';

class CantiqueDetailScreen extends StatelessWidget {
  final Cantique cantique;

  const CantiqueDetailScreen({super.key, required this.cantique});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Text("Cantique n° ${cantique.numero}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cantique.titre.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  cantique.cantique,
                  style: const TextStyle(fontSize: 16, height: 1.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
