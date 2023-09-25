import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// https://docs.fleaflet.dev/layers/polygon-layer

class MapExample extends StatefulWidget {
  MapExample({super.key});

  @override
  _MapExampleState createState() => _MapExampleState();
}

class _MapExampleState extends State<MapExample> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Flutter-Maps-Example"),
          backgroundColor: Colors.orange

      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(49.791560300794615, 9.945795763150798),
          zoom: 18,
          maxZoom: 18, // in OSM maximaler Zoom

        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'org.didszun.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(49.791560300794615, 9.945795763150798),
                width: 80,
                height: 80,
                builder: (context) =>
                const Icon(
                    Icons.close_fullscreen,
                    color: Colors.deepOrange,
                    shadows: <Shadow>[
                      Shadow(color: Colors.white, blurRadius: 5.0)
                    ],
                    size: 25), // Icon() FlutterLogo(),
              ),
            ],
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                points: [
                  LatLng(49.7921622630431, 9.94494787530687),
                  LatLng(49.79195424390552, 9.94560665412181),
                  LatLng(49.792134527209704, 9.946329878690388),
                  LatLng(49.792402639600425, 9.945363192385855),
                ],
                color: Colors.lightBlueAccent.withOpacity(0.5),
                isFilled: true,
                isDotted: true,
                borderColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}