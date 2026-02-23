import 'package:flutter/material.dart';
import 'package:eccofficiel/models/administration.dart';
import 'package:eccofficiel/screens/Administration/administration_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eccofficiel/theme.dart';

class AdministrationPage extends StatelessWidget {
  const AdministrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Administration de l’Église'),
        centerTitle: true,
      ),
      body: FutureBuilder<Administration>(
        future: AdministrationService.load(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Aucune donnée trouvée'));
          }
          final data = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            itemCount: data.sections.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Iconsax.document_text, size: 16, color: Colors.black54),
                        const SizedBox(width: 6),
                        Text(
                          data.language.toUpperCase(),
                          style: TextStyle(color: textGrey, fontSize: 12),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                  ],
                );
              }
              final s = data.sections[index - 1];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            s.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        if (s.ref != null)
                          Text(
                            s.ref!,
                            style: TextStyle(color: textGrey, fontSize: 12),
                          ),
                      ],
                    ),
                    if (s.text != null && s.text!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        s.text!,
                        style: const TextStyle(fontSize: 15, height: 1.6),
                      ),
                    ],
                    if (s.items.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      for (final it in s.items)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('• '),
                              Expanded(
                                child: Text(
                                  it,
                                  style: const TextStyle(fontSize: 15, height: 1.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
