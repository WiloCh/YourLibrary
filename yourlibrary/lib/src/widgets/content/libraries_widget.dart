import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yourlibrary/src/bloc/Map_bloc.dart';

class LibrariesWidget extends StatelessWidget {
  const LibrariesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return ChangeNotifierProvider<MapController>(
      create: (_) {
        final controller = MapController();
        return controller;
      },
      child: Scaffold(
        body: Selector<MapController, bool>(
          selector: (_, controller) => controller.loading,
          builder: (context, loading, loadingWidget) {
            if (loading) {
              return loadingWidget!;
            }

            return Consumer<MapController>(
              builder: (_, controller, gpsMessageWidget) {
                if (!controller.gpsEnabled) {
                  return gpsMessageWidget!;
                }

                return GoogleMap(
                  markers: controller.markers,
                  onMapCreated: controller.onMapCreated,
                  initialCameraPosition: controller.initialCameraPosition,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  onTap: controller.onTap,
                );
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Para usar nuestra aplicación necesitamos el acceso a su ubicación,\n por lo que debe habilitar el GPS",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        final controller = context.read<MapController>();
                        controller.turnOnGPS();
                      },
                      child: Text("Enciender el GPS"),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
