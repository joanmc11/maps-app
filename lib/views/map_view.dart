

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';

class MapView extends StatelessWidget {
  const MapView({super.key, required this.initialLocation, required this.polylines});

  final LatLng initialLocation;
  final Set<Polyline> polylines;

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);
    final location = BlocProvider.of<LocationBloc>(context);

    final CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (poiterMoveEvent) => mapBloc.add(StopFollowingUser()) ,
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          polylines: polylines,
          onMapCreated: (controller) => mapBloc.add(OnMapInitializeEvent(controller)),

          //TODO: Markers
          //TODO: polylines
          //TODO Cuando se mueve el mapa
        ),
      ),
    );
    ;
  }
}
