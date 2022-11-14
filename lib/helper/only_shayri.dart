import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class OnlyShayri {
  late Database db;
  List mixShayri = [];

  //ValueNotifier<List<Map>> bookmarkList=ValueNotifier([]);
  // List likesQuotes = [];

  Future databaseGet() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "shayari.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "shayari.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
    // open the database
    var db = await openDatabase(path);

    mixShayri = await db.query('Shayari');

    print(mixShayri.length);
  }
}
