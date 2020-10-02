import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/bloc/theme_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocationPage extends StatefulWidget {
  const LocationPage({
    Key key,
  }) : super(key: key);
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    rootBundle.loadString('assets/map/normalMode.json').then((string) {
      _normalStyle = string;
    });
    rootBundle.loadString('assets/map/nightMode.json').then((string) {
      _nightStyle = string;
    });
    themeChangeProvider.darkTheme =
        await themeChangeProvider.themePrefs.getTheme();
  }

  String _nightStyle;
  String _normalStyle;
  // ignore: missing_return
  Future<bool> back() async {
    Navigator.of(context).pop('some valsue');
  }

  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(
        themeChangeProvider.darkTheme ? _nightStyle : _normalStyle);
    _controller.complete(controller);
  }

  final List<Marker> markers = [
    Marker(
        position: LatLng(41.342622, 69.337824),
        markerId: MarkerId('ItPark'),
        infoWindow: InfoWindow(title: 'It Park', snippet: 'GDG DevFest'))
  ];
  final cameraPosition = CameraPosition(
    target: LatLng(41.342622, 69.337824),
    zoom: 15,
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Hero(
              tag: 'Location',
              child: Material(
                  color: Colors.transparent,
                  child: Text('Location',
                      style: Theme.of(context).textTheme.headline1))),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.normal,
          mapToolbarEnabled: true,
          markers: markers.toSet(),
          cameraTargetBounds: CameraTargetBounds.unbounded,
          initialCameraPosition: cameraPosition,
        ),
      ),
    );
  }
}
