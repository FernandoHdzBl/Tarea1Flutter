import 'package:flutter/widgets.dart';

class ImageAsset {
  static const String _logo = 'imagenes/op.png';

  static AssetImage getLogo() {
    return const AssetImage(_logo);
  }
  
}