import 'package:hive/hive.dart';

class MyDataAdapter extends TypeAdapter<MyData> {
  @override
  final typeId = 0; // Replace with a unique ID for your class.

  @override
  MyData read(BinaryReader reader) {
    // Implement deserialization here.
    return MyData(
      reader.readString(), // Replace with the appropriate read methods for your class.
      reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, MyData obj) {
    // Implement serialization here.
    writer.writeString(obj.name); // Replace with the appropriate write methods for your class.
    writer.writeInt(obj.age);
  }
}

@HiveType(typeId: 0)
class MyData extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  MyData(this.name, this.age);
}