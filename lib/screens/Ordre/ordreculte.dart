import 'package:flutter/material.dart';
import 'package:eccofficiel/screens/Ordre/ordre_service.dart';
import 'package:eccofficiel/models/ordre_culte.dart';
import 'package:iconsax/iconsax.dart';

class OrdreCultePage extends StatelessWidget {
  const OrdreCultePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formes et ordre du culte'),
        centerTitle: true,
      ),
      body: FutureBuilder<OrdreCulte>(
        future: OrdreService.load(),
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
                        Icon(Iconsax.book_1, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
                        const SizedBox(width: 6),
                        Text(
                          data.language.toUpperCase(),
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12),
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
                        Text(
                          s.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        if (s.ref != null) ...[
                          const SizedBox(width: 8),
                          Text('(${s.ref})', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12)),
                        ]
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
                    if (s.saintsNames.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Noms saints',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      for (final n in s.saintsNames)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              Icon(Iconsax.blur, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  n.meaning.isNotEmpty
                                      ? '${n.name} — ${n.meaning}'
                                      : n.name,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                    if (s.rites.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Rites et sacrements',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      for (final r in s.rites)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${r.code}. ${r.title}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                r.text,
                                style: const TextStyle(fontSize: 15, height: 1.6),
                              ),
                            ],
                          ),
                        ),
                    ],
                    if (s.conditions.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Conditions d’adhésion',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      for (int i = 0; i < s.conditions.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${i + 1}. '),
                              Expanded(
                                child: Text(
                                  s.conditions[i],
                                  style: const TextStyle(fontSize: 15, height: 1.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                    if (s.definitions.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Définitions',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      for (final d in s.definitions)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 15,
                                height: 1.6,
                              ),
                              children: [
                                TextSpan(
                                  text: '${d.code}. ',
                                  style:
                                      const TextStyle(fontWeight: FontWeight.w600),
                                ),
                                TextSpan(text: d.text),
                              ],
                            ),
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
