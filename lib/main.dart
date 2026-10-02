import 'package:flutter/material.dart';

void main() {
  runApp(const MiPerfilApp());
}

class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil Académico Interactivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 16, 4, 244)),
        useMaterial3: true,
        // Fondo gris muy claro para que resalten las tarjetas blancas
        scaffoldBackgroundColor: const Color.fromARGB(255, 211, 216, 224), 
      ),
      home: const PerfilScreen(nombreEstudiante: 'Emerson Cristhian Montenegro Coaquira'),
    );
  }
}

class PerfilScreen extends StatefulWidget {
  final String nombreEstudiante;

  const PerfilScreen({super.key, required this.nombreEstudiante});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  // 1. VARIABLES DE DIFERENTES TIPOS (Sesión 02)
  late String nombre;
  int np = 74; // NÚMERO PERSONAL (NP) ACTUALIZADO
  double promedioPonderado = 16.5; 
  bool estaMatriculado = true; 

  // Contador de logros inicializado exactamente en NP (Sesión 03)
  late int contadorLogros;

  @override
  void initState() {
    super.initState();
    nombre = widget.nombreEstudiante;
    contadorLogros = np; // Inicializado en 74
  }

  // Bucle FOR para calcular los primeros 5 múltiplos de NP (Sesión 02)
  List<int> obtenerMultiplos() {
    List<int> multiplos = [];
    for (int i = 1; i <= 5; i++) {
      multiplos.add(np * i);
    }
    return multiplos;
  }

  // Incrementar el contador de logros con setState (Sesión 03)
  void _incrementarLogro() {
    setState(() {
      contadorLogros++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lógica if-else para clasificar el NP (Sesión 02)
    String evaluacionParidad = (np % 2 == 0)
        ? 'Tu número personal es par'
        : 'Tu número personal es impar';
        
    String evaluacionMagnitud = (np > 50) 
        ? 'Número personal alto' 
        : 'Número personal bajo';

    List<int> listaMultiplos = obtenerMultiplos();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App de Emerson', 
          style: TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w400)
        ),
        // Color lila/azulado claro exacto al de la imagen
        backgroundColor: const Color.fromARGB(255, 4, 170, 236), 
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECCIÓN 1: DATOS PERSONALES (Sin título de tarjeta, igual a la imagen)
            Card(
              elevation: 1,
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• Nombre completo: $nombre', style: const TextStyle(fontSize: 15)),
                    const SizedBox(height: 6),
                    Text('• Número Personal (NP): $np', style: const TextStyle(fontSize: 15)),
                    const SizedBox(height: 6),
                    Text('• Promedio ponderado: $promedioPonderado', style: const TextStyle(fontSize: 15)),
                    const SizedBox(height: 6),
                    Text('• Estado matriculado: ${estaMatriculado ? "Sí" : "No"}', style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // SECCIÓN 2: CLASIFICACIÓN CON IF-ELSE
            Card(
              elevation: 1,
              color: const Color(0xFFEEF0F8), // Tono azulado muy sutil
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚖️ Análisis de NP (Lógica if-else)',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const Divider(height: 24, thickness: 1),
                    Text('• $evaluacionParidad', style: const TextStyle(fontSize: 15)),
                    const SizedBox(height: 6),
                    Text('• $evaluacionMagnitud', style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // SECCIÓN 3: BUCLE FOR (MÚLTIPLOS)
            Card(
              elevation: 1,
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🔢 Múltiplos de NP (Calculados con for)',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const Divider(height: 24, thickness: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        listaMultiplos.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            '• Múltiplo ${index + 1} ($np × ${index + 1}): ${listaMultiplos[index]}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // SECCIÓN 4: INTERACTIVIDAD (StatefulWidget)
            Card(
              elevation: 1,
              color: const Color.fromARGB(255, 174, 240, 204), // Fondo verde claro
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        '🥇 Contador de Logros Académicos',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '$contadorLogros',
                        style: const TextStyle(
                          fontSize: 42, 
                          fontWeight: FontWeight.w500, 
                          color: Color.fromARGB(255, 32, 51, 156), // Número en azul índigo
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _incrementarLogro,
                        icon: const Icon(Icons.add_task, size: 20),
                        label: const Text('Sumar logro', style: TextStyle(fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 62, 232, 195), // Botón claro
                          foregroundColor: const Color.fromARGB(255, 20, 20, 20),
                          elevation: 1,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacio final
          ],
        ),
      ),
    );
  }
}