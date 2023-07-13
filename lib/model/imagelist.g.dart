// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagelist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageListAdapter extends TypeAdapter<ImageList> {
  @override
  final int typeId = 1;

  @override
  ImageList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageList(
      id: fields[0] as int,
      name: fields[1] as String,
      category: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
