import 'package:flutter/material.dart';
import '../../../models/cantique.dart';

class CantiqueCard extends StatelessWidget {
  final Cantique cantique;

  const CantiqueCard({super.key, required this.cantique});

  IconData _getIcon(String name) {
    switch (name) {
      case 'music_note':
        return Icons.music_note;
      case 'auto_awesome':
        return Icons.auto_awesome;
      default:
        return Icons.library_music;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            _getIcon(cantique.icone),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          '${cantique.numero}. ${cantique.titre}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          cantique.cantique,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
