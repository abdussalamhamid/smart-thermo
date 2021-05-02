import 'package:flutter/material.dart';
import 'package:mySalat/routes.dart';

//Main
class UserMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.block),
      ),
      body: Center(
        child: Container(
          color: Color(0xff0a5f69),
          constraints: BoxConstraints.expand(),
          child: Container(
            height: size.height * 1,
            width: size.width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Body Temperature',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Graph.PNG'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Location Heatmap',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Map.PNG'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
