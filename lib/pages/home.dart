import 'package:flutter/material.dart';
import 'package:gadabout/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/mars horizon.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Transform.translate(
                  offset: Offset(-30, -30),
                  child: Image.asset('assets/background.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LET'S BOOK A",
                          style: getHeaderStyle(),
                        ),
                        Row(
                          children: [
                            Text(
                              "TRIP ",
                              style: getHeaderStyle(
                                  fontColor: Colors.blue[100] as Color),
                            ),
                            Text(
                              " TO ",
                              style: getHeaderStyle(fontFamily: "CocoBiker"),
                            ),
                            Text(
                              " MARS",
                              style: getHeaderStyle(
                                  fontColor: Colors.orange[800] as Color),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "LET'S BOOK A",
//                         style: getHeaderStyle(),
//                       ),
//                       TextSpan(
//                         text: "\nTRIP",
//                         style: getHeaderStyle(
//                             fontColor: Colors.blue[100] as Color),
//                       ),
//                       TextSpan(
//                         text: " MARS",
//                         style: getHeaderStyle(
//                             fontColor: Colors.orange[800] as Color),
//                       ),
//                     ],
//                   ),
//                 ),
