import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/config/init.dart';
import 'model/boximages.dart';
import 'model/imagelist.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ImageListAdapter());
  boxImages = await Hive.openBox<ImageList>('imageBox');
  runApp(const InitRoot());
}
