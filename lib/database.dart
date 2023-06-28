import 'dart:io';
import 'package:skyriderairlinesapp/usermodel.dart';
import 'package:skyriderairlinesapp/booking_data.dart';
import 'package:skyriderairlinesapp/my_bookings.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DbHelper {
  static Database? _db;

  static const String DB_Name = 'skyrider_airlinesss.db';
  static const String Table_User = 'user';
  static const String Table_oneway = 'oneway_booking';
  static const int Version = 1;
  static const int Version2 = 2;

  static const String C_UserName = 'user_name';
  static const String C_Password = 'password';

  //data that collect from booking

  static const String depart = 'departure';
  static const String arr = 'arrival';
  static const String flightnum = 'flight_number';
  static const int passenger = 1;
  static const int price = 0;
  static const String name = 'contact_name';
  static const String ic = 'contact_ic';
  static const String booknum = 'booking_num';
  static const String phone = 'contact_phone';
  static const String email = 'contact_email';
  static const String type = 'trip_type';




  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }




  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE IF NOT EXISTS $Table_User ("

        " $C_UserName TEXT, "
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_UserName)"
        ")");


    await db.execute('''
    CREATE TABLE IF NOT EXISTS $Table_oneway (
      user_name TEXT,
      passenger TEXT,
      depart TEXT,
      arrival TEXT,
      date TEXT,
      time TEXT,
      trip_type TEXT,
      price TEXT,
      flight_num TEXT,
      booking_num TEXT PRIMARY KEY,
      contact_name TEXT,
      contact_id TEXT,
      contact_phone TEXT,
      contact_email TEXT
    )
  ''');

    return db;

  }


  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String userName, String password) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserName = '$userName' AND "
        "$C_Password = '$password'");

    if (res.length>0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.update(Table_User, user.toMap(),
        where: '$C_UserName = ?', whereArgs: [user.user_name]);
    return res;
  }




  Future<int> deleteUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.delete(Table_User, where: '$C_UserName = ?', whereArgs: [user.user_name]);
    return res;
  }




  //*********************************************************************************************************************************************


  Future<int> savebooking(onewaybooking onebook) async {

    var dbc = await db;
    var res = await dbc!.insert(Table_oneway, onebook.toMap());
    return res;
  }

  Future<List<onewaybooking>> getbookingdetails(String userName) async {
    var dbClient = await db;
    List<Map<String, dynamic>> results = await dbClient!.rawQuery(
      "SELECT * FROM $Table_oneway WHERE $C_UserName = '$userName'",
    );
    return results.map((map) => onewaybooking.fromMap(map)).toList();
  }


  Future<int> deleteBooking(onewaybooking onebook) async {
    var dbClient = await db;
    var res = await dbClient!.delete(Table_oneway, where: '$booknum = ?', whereArgs: [onebook.booknum]);
    return res;

  }






}
