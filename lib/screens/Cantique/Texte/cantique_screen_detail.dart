import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/cantique.dart';

class CantiqueDetailScreen extends StatefulWidget {
  final Cantique cantique;
  const CantiqueDetailScreen({super.key, required this.cantique});

  @override
  State<CantiqueDetailScreen> createState() => _CantiqueDetailScreenState();
}

class _CantiqueDetailScreenState extends State<CantiqueDetailScreen> {
  double _fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cantique n° ${widget.cantique.numero}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.text_decrease),
            onPressed: () => setState(() => _fontSize = (_fontSize - 2).clamp(12, 28)),
          ),
          IconButton(
            icon: const Icon(Icons.text_increase),
            onPressed: () => setState(() => _fontSize = (_fontSize + 2).clamp(12, 28)),
          ),
          IconButton(
            icon: const Icon(Icons.copy_all_outlined),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: widget.cantique.cantique));
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text('Texte copié'), behavior: SnackBarBehavior.floating),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.cantique.titre.toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                label: Text(widget.cantique.typee.trim()),
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              child: SelectableText(
                widget.cantique.cantique,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: _fontSize, height: 1.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
