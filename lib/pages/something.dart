// import 'package:flutter/cupertino.dart';

// Widget scoop() {
//   return Container(
//     // height: 300,
//     // width: 300,
//     child: Column(
//       children: [
//         TheSingleCard(
//           title: widget.title,
//           detailed: widget.detail,
//           author: widget.author,
//         ),
//         Container(
//           // width: size.width,
//           height: 150,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                 child: Container(
//                   color: darkBlueHex,
//                   width: size.width * 0.3,
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     "Location : ስለ ዲሲ ማዘጋጃ ቤት ቤተመፃህፍት ጥያቄዎች ካሉዎት ወደ ቢሯችን በ (202) ",
//                     style: TextStyle(
//                       // color: warmOrangeHex,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//               Card(
//                 margin: EdgeInsets.only(bottom: 10, top: 10),
//                 child: Container(
//                   color: darkBlueHex,
//                   width: size.width * 0.3,
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     "Description: ቢሮዎቻችንን ሲጎበኙ ወይም ሲደውሉልን የሰራተኞቻችን አባል እርስዎን ልንረዳዎ እንድንችል በአስተርጓሚ በአካል ሊያገናኝዎት ይችላል ፡፡",
//                     style: TextStyle(
//                       // color: warmOrangeHex,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//               Column(
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Card(
//                     margin: EdgeInsets.only(bottom: 10, top: 10),
//                     child: Container(
//                       color: darkBlueHex,
//                       width: size.width * 0.3,
//                       padding: EdgeInsets.all(10),
//                       child: Text(
//                         "Time: 2:30",
//                         style: TextStyle(
//                           // color: warmOrangeHex,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Consumer<ColorProvider>(
//                     builder: (context, state, _) {
//                       return Card(
//                         margin: EdgeInsets.only(bottom: 10),
//                         child: Container(
//                           color: state.color,
//                           width: size.width * 0.3,
//                           padding: EdgeInsets.all(10),
//                           child: Text(
//                             "Attending",
//                             style: TextStyle(
//                               // color: warmOrangeHex,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: goingColor,
//                 // primary: yellowtext,
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//               ),
//               onPressed: () {
//                 colorProvider.changeColor(Colors.green);
//               },
//               child: Text("Yes, I am going",
//                   style: TextStyle(
//                     // backgroundColor: warmOrangeHex,
//                     fontWeight: FontWeight.w300,
//                   )),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: goingColor,
//                 // primary: yellowtext,
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//               ),
//               onPressed: () {
//                 colorProvider.changeColor(Colors.red);
//               },
//               child: Text("No, I am not going",
//                   style: TextStyle(
//                     // backgroundColor: warmOrangeHex,
//                     fontWeight: FontWeight.w300,
//                   )),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
