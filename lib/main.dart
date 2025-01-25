import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_linkedin_banner/icons.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AspectRatio(
            aspectRatio: 1584 / 396,
            child: Stack(
              children: [
                Opacity(
                  opacity: .4,
                  child: SizedBox.expand(
                    child: Image.asset(
                      "assets/bg.jpg",
                      fit: BoxFit.cover,
                      alignment: AlignmentDirectional(0, -0.3),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                    Color(0xBE36D1DC),
                    Color(0xBE5B86E5),
                  ])),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "AmirAbbas Jannatian",
                        style: TextStyle(
                          color: Color(0xB3FFFFFF),
                          fontSize: width * 0.036,
                          height: 0.8,
                        ),
                      ),
                      Text(
                        "Mobile Application Developer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.042,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: width*.008),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: width*.028,
                        children: [
                          ...[flutter, dart, kotlin, androidStudio, android, apple].map((e) => GlassIconBox(
                            iconSvg: e,
                            size: width * .05,
                          ))
                        ],
                      ),
                      SizedBox(height: width*.008),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.string(
                            gmail,
                            color: Color(0xE5FFFFFF),
                            width: width * .02,
                          ),
                          SizedBox(width: width * 0.005),
                          Text(
                            "amirabbasaa@gmail.com",
                            style: TextStyle(
                              color: Color(0xE5FFFFFF),
                              fontSize: width * 0.02,
                            ),
                          ),
                          SizedBox(width: width * 0.24),
                          SvgPicture.string(
                            github,
                            color: Color(0xE5FFFFFF),
                            width: width * .02,
                          ),
                          SizedBox(width: width * 0.005),
                          Text(
                            "amir14a",
                            style: TextStyle(
                              color: Color(0xE5FFFFFF),
                              fontSize: width * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassIconBox extends StatelessWidget {
  final String iconSvg;
  final double size;

  const GlassIconBox({super.key, required this.iconSvg, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: size*.03
          ),
          borderRadius: BorderRadius.circular(size * .45)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(size * .45),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16,sigmaY: 16),
          child: Container(
            color: Color(0x1AFFFFFF),
            child: Padding(
              padding: EdgeInsets.all(size*.25),
              child: SvgPicture.string(
                iconSvg,
                width: size,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
