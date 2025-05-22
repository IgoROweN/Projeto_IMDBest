import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PremiacoesScreen extends StatelessWidget {
  const PremiacoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: ApiService().listarPremiacoes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar premiações'));
        }
        final premiacoes = snapshot.data ?? [];
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: premiacoes.length,
          itemBuilder: (context, index) {
            final premio = premiacoes[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text(premio['nome'] ?? premio['premio'] ?? 'Premiação'),
                subtitle: Text('Ano: ${premio['ano'] ?? ''}'),
                onTap: () {
                  // Navegar para detalhes da premiação
                },
              ),
            );
          },
        );
      },
    );
  }
}