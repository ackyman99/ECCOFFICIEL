import 'package:flutter/material.dart';
import '../../../models/cantique.dart';
import 'cantique_service.dart';
import 'cantique_card.dart';

class CantiqueListPage extends StatelessWidget {
  const CantiqueListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cantiques'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Cantique>>(
        future: CantiqueService.loadCantiques(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun cantique trouvé'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return CantiqueCard(cantique: snapshot.data![index]);
            },
            cacheExtent: 600,
          );
        },
      ),
    );
  }
}
