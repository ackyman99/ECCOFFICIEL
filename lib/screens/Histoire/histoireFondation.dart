import 'package:flutter/material.dart';
import 'package:eccofficiel/screens/Histoire/histoire_service.dart';
import 'package:eccofficiel/models/histoire_fondation.dart';
import 'package:eccofficiel/theme.dart';

class HistoireFondationPage extends StatelessWidget {
  const HistoireFondationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histoire de la Fondation'),
        centerTitle: true,
      ),
      body: FutureBuilder<HistoireFondation>(
        future: HistoireService.load(),
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
                    Text(
                      data.source,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${data.location} • ${data.date}',
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12),
                    ),
                    const Divider(height: 24),
                  ],
                );
              }
              final s = data.sections[index - 1];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      height: 1.6,
                    ),
                    children: [
                      TextSpan(
                        text: '${s.n}. ',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: s.text),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
