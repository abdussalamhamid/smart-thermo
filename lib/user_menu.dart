import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';
import 'package:mySalat/routes.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//Main
class UserMenu extends StatefulWidget {
  @override
  _UserMenuState createState() => _UserMenuState();
}

class HardData {
  final int temp;
  final int time;

  HardData(this.temp, this.time);
}

class _UserMenuState extends State<UserMenu> {
  int temp;
  Timer timer;

  Completer<GoogleMapController> _controller = Completer();
  final Set<Heatmap> _heatmaps = {};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(1.556608577445251, 103.64303729472374),
    zoom: 16.4746,
  );
  LatLng _heatmapLocation = LatLng(1.556608577445251, 103.64303729472374);
  // LatLng _heatmapLocation = LatLng(37.42796133580664, -122.085749655962);
  // LatLng _heatmapLocation2 = LatLng(38.32796133580690, -122.185749655940);

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(1.556608577445251, 103.64303729472374),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addHeatmap();
    temp = Random().nextInt(10);
    // temp = DateTime.now().second.toString();
    timer = new Timer.periodic(
        Duration(seconds: 2),
        (Timer t) => setState(() {
              temp = Random().nextInt(10);
              // temp = DateTime.now().second.toString();
            }));
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Salam"),
                accountEmail: Text("Salam123@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                )),
            ListTile(
              title: Text('Item1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.block),
      ),
      //   floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _addHeatmap,
      //   label: Text('Add Heatmap'),
      //   icon: Icon(Icons.add_box),
      // ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temperature',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '36.' + temp.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              heatmaps: _heatmaps,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addHeatmap() {
    setState(() {
      _heatmaps.add(Heatmap(
          heatmapId: HeatmapId(_heatmapLocation.toString()),
          points: _createPoints(_heatmapLocation),
          radius: 20,
          visible: true,
          gradient: HeatmapGradient(
              colors: <Color>[Colors.green, Colors.red],
              startPoints: <double>[0.2, 0.8])));
      // _heatmaps.add(Heatmap(
      //     heatmapId: HeatmapId(_heatmapLocation2.toString()),
      //     points: _createPoints(_heatmapLocation2),
      //     radius: 20,
      //     visible: true,
      //     gradient: HeatmapGradient(
      //         colors: <Color>[Colors.green, Colors.red],
      //         startPoints: <double>[0.2, 0.8])));
    });
  }

  //heatmap generation helper functions
  List<WeightedLatLng> _createPoints(LatLng location) {
    final List<WeightedLatLng> points = <WeightedLatLng>[];
    //Can create multiple points here
    points.add(_createWeightedLatLng(location.latitude, location.longitude, 1));
    points.add(
        _createWeightedLatLng(location.latitude - 1, location.longitude, 1));
    return points;
  }

  WeightedLatLng _createWeightedLatLng(double lat, double lng, int weight) {
    return WeightedLatLng(point: LatLng(lat, lng), intensity: weight);
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

// fakeBody(){
//   return Container(
//         color: Color(0xff0a5f69),
//         constraints: BoxConstraints.expand(),
//         child: Container(
//           height: size.height * 1,
//           width: size.width * 1,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(20),
//                 width: size.width * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Body Temperature',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                     Container(
//                       height: size.height * 0.15,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/Graph.PNG'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(20),
//                 width: size.width * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text('Location Heatmap',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                     Container(
//                       height: size.height * 0.3,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/Map.PNG'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }

//Classes
// class MenuButton extends StatelessWidget {
//   const MenuButton({this.title, this.asset, this.onPress, Key key})
//       : super(key: key);
//   final String asset;
//   final String title;
//   final Function onPress;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         height: size.height * 0.15,
//         width: size.width * 0.2,
//         //padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.bottomRight,
//             end: Alignment.topLeft,
//             colors: [
//               Colors.cyan[800],
//               Colors.cyan[50],
//             ],
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               height: size.height * 0.35,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(asset),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   .copyWith(color: Colors.black, fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
