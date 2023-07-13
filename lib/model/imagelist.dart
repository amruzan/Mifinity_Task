import 'package:hive/hive.dart';

part 'imagelist.g.dart';

@HiveType(typeId: 1)
class ImageList {
  ImageList({required this.id, required this.name, required this.category});

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String category;
}
