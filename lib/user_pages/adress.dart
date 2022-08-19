import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/ui.dart';
import '../provider/simle_provider.dart';

class Adress extends StatefulWidget {
  const Adress({Key? key}) : super(key: key);

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  // Completer<GoogleMapController> _controller = Completer();

  MapType mapType = MapType.terrain;
  LatLng latLng = LatLng(41.33279668831619, 69.28374709224211);
  GoogleMapController? _googleMapController;

  double plusmap = 17;

  late CameraPosition _initialCameraPosition;

  //
  @override
  void initState() {
    super.initState();
    _initialCameraPosition = CameraPosition(target: latLng, zoom: plusmap);
  }

  Future<Uint8List?> getBytesFromAsset(String path) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: pixelRatio.round() * 80);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<Set<Marker>> iconmap() async {
    List<Marker> markers = <Marker>[];
    final Uint8List? markerIcon =
        await getBytesFromAsset('assets/images/logo.png');
    final icona = await BitmapDescriptor.fromBytes(markerIcon!);
    Marker marker = Marker(
        markerId: MarkerId("Belgaum"),
        position: LatLng(41.33279668831619, 69.28374709224211),
        infoWindow: InfoWindow(title: "Belgaum"),
        icon: icona);

    markers.add(marker);

    return markers.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Text(
            Ui.adressfix[context.watch<SimpleProvider>().getuzru]!,
            style: TextStyle(
                fontFamily: Ui.textstyle,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ),
        Divider(),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            Ui.adress[context.watch<SimpleProvider>().getuzru]!,
            style: TextStyle(
                fontFamily: Ui.textstyle,
                fontWeight: FontWeight.w300,
                fontSize: 20),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "Телефон: ${Ui.phone}",
            style: TextStyle(
                fontFamily: Ui.textstyle,
                fontWeight: FontWeight.w300,
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (mapType == MapType.terrain) {
                        mapType = MapType.hybrid;
                      } else {
                        mapType = MapType.terrain;
                      }
                    });
                  },
                  icon: Icon(Icons.map)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      plusmap = plusmap + 1;

                      _googleMapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: latLng, zoom: plusmap)));
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () async {
                    setState(() {
                      plusmap = plusmap - 1;
                      _googleMapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: latLng, zoom: plusmap)));
                    });
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: iconmap(),
              initialData: Set.of(<Marker>[]),
              builder: (context, snapshot) {
                final icons = snapshot.data as Set<Marker>;
                return GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  mapToolbarEnabled: true,
                  mapType: mapType,
                  markers: icons,
                  myLocationEnabled: true,
                  scrollGesturesEnabled: true,
                  minMaxZoomPreference: MinMaxZoomPreference(6, 19),
                  onMapCreated: (_controller) {
                    setState(() {
                      _googleMapController = _controller;
                    });
                  },
                  initialCameraPosition: _initialCameraPosition,
                );
              }),
        ),
      ],
    );
  }
}
