import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/gps/gps_bloc.dart';

class GpsAccesScreen extends StatelessWidget {
  const GpsAccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
      builder: (BuildContext context, state) {
       
        return !state.isGpsEnabled
            ? const _EnableGpsMessage()
            : const _AccesButton();
      },
    ));
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('Es necesario el acceso a GPS'),
        ),
        MaterialButton(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAcces();
          },
          color: Colors.black,
          shape: const StadiumBorder(),
          splashColor: Colors.orange.withOpacity(0.3),
          child: const Text(
            'Solicitar Acceso',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Debe habilitar el GPS',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
    );
  }
}
