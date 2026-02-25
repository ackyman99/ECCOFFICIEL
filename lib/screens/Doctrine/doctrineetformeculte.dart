import 'package:flutter/material.dart';
import 'package:eccofficiel/screens/Doctrine/doctrine_service.dart';
import 'package:eccofficiel/models/doctrine.dart';
import 'package:eccofficiel/theme.dart';
import 'package:iconsax/iconsax.dart';

class DoctrineEtFormeCultePage extends StatelessWidget {
  const DoctrineEtFormeCultePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctrine et forme du culte'),
        centerTitle: true,
      ),
      body: FutureBuilder<Doctrine>(
        future: DoctrineService.load(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Aucune donnée trouvée'));
          }
          final data = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Text(
                data.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Iconsax.book, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
                  const SizedBox(width: 6),
                  Text(
                    'Réf. ${data.reference}',
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                data.intro,
                style: const TextStyle(fontSize: 15, height: 1.5),
              ),
              const Divider(height: 28),
              for (final r in data.rules)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                        height: 1.6,
                      ),
                      children: [
                        TextSpan(
                          text: '${r.id}. ',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: r.text),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
