import 'package:flutter/material.dart';
import 'package:undercover_app/util/utils.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('关于我们'),
          centerTitle: true,
        ),
        body: _buildAboutBg());
  }

  Widget _buildAboutBg() {
    return new Image.asset(
      Utils.getImgPath('about_bg'),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }
}
