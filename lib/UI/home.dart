import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:six_weeks/UI/gridView.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,

        actions: [
          //   Adding Icons in appBar
          IconButton(
            onPressed: () {

            Fluttertoast.showToast(
                msg: "Home Icon Pressed" ,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.amber,
              fontSize: 15,
              gravity: ToastGravity.BOTTOM
            );
            },
            icon: Icon(Icons.home, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_city, color: Colors.white),
          ),
        ],
      ),

      body: FlipGrid(),

    //
    );
  }
}

// body: SingleChildScrollView(
//     child: Center(
//       child: Column(
//         children: [
//
//           // Rotated Box
//           RotatedBox(
//             quarterTurns: 1,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: 300,
//                   height: 150,
//                   child: Image.network(
//                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIVrXKlLePBJiApzMib-81KFrZgU3mrqQzPQ&s",
//                     width: 100,
//                     height: 100,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//
//
//         // Animation
//         (Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: 300,
//                   height: 150,
//                   child: Image.network(
//                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIVrXKlLePBJiApzMib-81KFrZgU3mrqQzPQ&s",
//                     width: 100,
//                     height: 100,
//                   ),
//                 ),
//               ),
//         ) .animate()
//             .fadeIn(duration: 1000.ms)
//             .slideX(begin: 1, end: 0)
//             .scale(begin: const Offset(0.8, 0.8), end: Offset(1, 1))
//
// //             1. .fadeIn(duration: 1000.ms)
// //
// //         Purpose: Makes the widget appear gradually by changing its opacity from 0 (invisible) to 1 (fully visible).
// //
// //   Duration: 1000 milliseconds (i.e., 1 second) for the full fade-in.
// //
// // 🟢 Effect: Smooth fade into view.
// // 2. .slideX(begin: 1, end: 0)
// //
// // Purpose: Moves the widget horizontally during the animation.
// //
// // begin: 1 means it starts from "1 screen width to the right".
// //
// // end: 0 means it ends at its original position.
// //
// // 🟢 Effect: Widget slides in from the right side of the screen to its normal spot.
// // 3. .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1))
// //
// // Purpose: Scales the size of the widget.
// //
// // begin: Offset(0.8, 0.8) means the widget starts at 80% of its size (both width and height).
// //
// // end: Offset(1, 1) means it scales up to 100% of its size.
// //
// // 🟢 Effect: Widget slightly "zooms in" as it appears.
//
// ),
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: 300,
//                 height: 150,
//                 child: Image.network(
//                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIVrXKlLePBJiApzMib-81KFrZgU3mrqQzPQ&s",
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//             ),
//           ),
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: 300,
//                 height: 150,
//                 child: Image.network(
//                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIVrXKlLePBJiApzMib-81KFrZgU3mrqQzPQ&s",
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
