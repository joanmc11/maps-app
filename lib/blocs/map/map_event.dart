part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializeEvent extends MapEvent {
  final GoogleMapController controller;
  const OnMapInitializeEvent(this.controller);
}

class StopFollowingUser extends MapEvent {}

class StartFollowingUser extends MapEvent {}

class UpdateUserPolylineEvent extends MapEvent {
  final List<LatLng> userLocation;

  const UpdateUserPolylineEvent(this.userLocation);
}

class OnToggleUserRoute extends MapEvent{}
