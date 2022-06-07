import 'package:flutter/material.dart';

import '../utilities/styles.dart';

class PageOnboarding extends StatelessWidget {
  final String infoPrincipal;
  final String infoDetalhes;
  final AssetImage image;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  PageOnboarding({
    required this.infoPrincipal,
    required this.infoDetalhes,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: image,
              height: 250.0,
              width: 250.0,
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            infoPrincipal,
            style: kTitleStyle,
          ),
          const SizedBox(height: 15.0),
          Text(
            infoDetalhes,
            style: kSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
