import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Mapa extends StatefulWidget {
  @override
  MapaState createState() => MapaState();
}

class MapaState extends State<Mapa> {
  // Controlador do Google Map
  GoogleMapController? _controladorMapa;

  // Pontos específicos das duas localidades
  final LatLng _pontoA = LatLng(-20.434351, -54.616956); // Rua 14 de Julho, 5141
  final LatLng _pontoB = LatLng(-8.4976187, -35.004090872732036); // Av. Afonso Pena, 4909

  // Variável para armazenar a distância calculada
  String _distancia = "0 km";

  @override
  void initState() {
    super.initState();
    _calcularDistancia(); // Calcula a distância assim que a tela é carregada
  }

  // Método para calcular a distância entre dois pontos
  void _calcularDistancia() {
    final distanciaEmMetros = Geolocator.distanceBetween(
      _pontoA.latitude,
      _pontoA.longitude,
      _pontoB.latitude,
      _pontoB.longitude,
    );

    setState(() {
      _distancia = (distanciaEmMetros / 1000).toStringAsFixed(2) + " km";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distância entre Dois Pontos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) => _controladorMapa = controller,
              initialCameraPosition: CameraPosition(
                target: _pontoA, // Centralizando o mapa no ponto A
                zoom: 14,
              ),
              markers: {
                Marker(markerId: MarkerId('pontoA'), position: _pontoA),
                Marker(markerId: MarkerId('pontoB'), position: _pontoB),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Distância: $_distancia', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}