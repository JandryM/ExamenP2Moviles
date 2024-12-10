import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/get_data/get_data_bloc.dart';
import '../bloc/get_data/get_data_event.dart';
import '../bloc/get_data/get_data_state.dart';

class DataListScreen extends StatelessWidget {
  const DataListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email ?? 'Usuario no autenticado';

    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen y sombreado
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpeg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6), // Sombrado oscuro
          ),
          SafeArea(
            child: Column(
              children: [
                // Encabezado con estilo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Consulta de Datos',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            userEmail,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.logout, color: Colors.white),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacementNamed('/login');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Contenido principal
                Expanded(
                  child: BlocProvider(
                    create: (_) => GetDataBloc()..add(LoadDataEvent()),
                    child: BlocBuilder<GetDataBloc, GetDataState>(
                      builder: (context, state) {
                        if (state is DataLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else if (state is DataEmpty) {
                          return const Center(
                            child: Text(
                              'No hay datos registrados.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else if (state is DataLoaded) {
                          final data = state.data;
                          return ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final item = data[index];
                              return Card(
                                color: Colors.white.withOpacity(0.9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                margin: const EdgeInsets.only(bottom: 12),
                                child: ListTile(
                                  title: Text(
                                    item['nombre'] ?? 'Sin nombre',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Duración: ${item['duracion'] ?? 'N/A'} min\nEn cartelera: ${item['enCartelera'] == true ? 'Sí' : 'No'}',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.movie,
                                    color: item['enCartelera'] == true ? Colors.green : Colors.red,
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is DataError) {
                          return Center(
                            child: Text(
                              'Error: ${state.message}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade800,
        onPressed: () {
          Navigator.of(context).pushNamed('/add-data');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
