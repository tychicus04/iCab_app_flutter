import 'package:flutter/material.dart';
import 'package:flutter_booking_car/core/helper/asset_helper.dart';
import 'package:flutter_booking_car/core/helper/image_helper.dart';
import 'package:flutter_booking_car/model/place_item_res.dart';
import 'package:flutter_booking_car/src/widget/home_menu.dart';
import 'package:flutter_booking_car/src/widget/ride_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen.dart";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _tripDistance = 0;
  final Map<String, Marker> _markers = <String, Marker>{};

  // ignore: unused_field
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: [
            const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(10.7915178, 106.7271422),
                zoom: 14.4746,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: const Text(
                      'Taxi-App',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    leading: TextButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      }, 
                      child: ImageHelper.loadFromAsset(
                        AssetHelper.ic_menu,
                      ),
                    ),
                    actions: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.bell),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: RidePicker(onPlaceSelected)
                  )
                ]
              )
            ),
            // Positioned(
            //   left: 20, 
            //   right: 20, 
            //   bottom: 40,
            //   height: 248,
            //   // child: CarPickup()
            // )
          ]
        )
      ),
      drawer: const Drawer(
        child: HomeMenu(),
      ),
    );
  }

  void onPlaceSelected(PlaceItemRes place, bool fromAddress) {
    var mkId = fromAddress ? 'from_address' : 'to_address';
  }

  // void _addMarker(String mkId, PlaceItemRes place) async {
  //   _markers.remove(mkId);
  //   _mapController.clearMarkers();

  //   _markers[mkId] = Marker(
  //     markerId: mkId,
  //     MarkerOptions(
  //       position: LatLng(place.lat, place.lng),
  //       InfoWindowText: InfoWindowText(place.name, place.address)));

  //   for(var m in _markers.values) {
  //     await _mapController.addMarker(m.options);
  //   }
  // }

  // void _moveCamera() {
  //   if(_markers.values.length > 1) {

  //   }
  // }
}