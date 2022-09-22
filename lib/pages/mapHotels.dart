import 'package:karibukwako/models/HomeLocation.dart';
import 'package:label_marker/label_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widget/map_dialog.dart';


class MapHotels extends StatefulWidget {
  MapHotels({this.rooms});
  final List<HomeLocation>? rooms;
  @override
  State<MapHotels> createState() => _MapHotels();
}

class _MapHotels extends State<MapHotels> {
  late String _mapStyle;
  late GoogleMapController _mapController;
  final Set<Marker> markers = new Set();

  LatLng _lastMapPosition = _center;

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  _onMapCreated(GoogleMapController controller) {
    if (mounted) {
      setState(() {
        _mapController = controller;
        controller.setMapStyle(_mapStyle);

        LatLng latLng_1 = LatLng(
          double.parse(widget.rooms![0].latitude),
          double.parse(widget.rooms![0].longitude),
        );
        LatLng latLng_2 = LatLng(
          double.parse(widget.rooms![widget.rooms!.length -1].latitude),
          double.parse(widget.rooms![widget.rooms!.length -1].longitude),
        );

        for(var i = 0; i < widget.rooms!.length; i++){
          markers.addLabelMarker(LabelMarker(
              label: '${widget.rooms![i].categories[0].name} ${widget.rooms![i].detail.number_pieces} pièces \n ${widget.rooms![i].prices} \$',
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0
              ),
              markerId: MarkerId('${widget.rooms![i].id}'),
              position: LatLng(
                  double.parse(widget.rooms![i].latitude),
                  double.parse(widget.rooms![i].longitude)
              ),
              backgroundColor: Colors.green,
              onTap: (){
                show_room_map_dialog(context, widget.rooms![i]);
              }
          )).then((value) {
            setState(() {});
          },
          );
        }

        LatLngBounds bound = LatLngBounds(southwest: latLng_1, northeast: latLng_2);
        CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
        this._mapController.animateCamera(u2).then((void v){
          check(u2,this._mapController);
        });
      });
    }
  }

  void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    _mapController.animateCamera(u);
    LatLngBounds l1=await c.getVisibleRegion();
    LatLngBounds l2=await c.getVisibleRegion();
    print(l1.toString());
    print(l2.toString());
    if(l1.southwest.latitude==-90 ||l2.southwest.latitude==-90)
      check(u, c);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  late CameraPosition _kGooglePlex;

  @override
  initState() {
    super.initState();
    rootBundle.loadString('assets/text/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.rooms![0].latitude), double.parse(widget.rooms![0].longitude)),
      zoom: 14.4746,
    );
    return Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: _onMapCreated,
          markers: markers,
          zoomControlsEnabled: true,
          onCameraMove: _onCameraMove,
        )
    );
  }
}