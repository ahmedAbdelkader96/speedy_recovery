// import 'dart:async';
// import 'dart:io' as io;
//
// import 'package:path/path.dart' ;
// import 'package:path_provider/path_provider.dart';
// import 'package:speedy_recovery_test/features/sign_up_log_in/Models/speedy_user.dart';
// import 'package:sqflite/sqflite.dart';
//
//
// class UsersDBHelper {
//   static Database? _db;
//   static const String iD = 'id';
//   static const String name = 'name';
//   static const String email = 'email';
//   static const String password = 'password';
//
//   static const String tABLE = 'users';
//   static const String dataBaseNAME = 'usersTable.db';
//
//   Future<Database?> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }
//
//   initDb() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, dataBaseNAME);
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }
//
//   _onCreate(Database db, int version) async {
//     await db
//         .execute("CREATE TABLE $tABLE ($iD INTEGER PRIMARY KEY,$name TEXT, $email TEXT, $password TEXT)");
//   }
//
//   Future<User> save(User user) async {
//     var dbClient = (await db)!;
//     user.id = await dbClient.insert(tABLE, user.toMap());
//     return user;
//   }
//
//   Future<List<User>> getUsersAccounts() async {
//     var dbClient = (await db)!;
//     List<Map> maps = await dbClient.query(tABLE, columns: [iD,name ,email, password]);
//     List<User> users = [];
//     if (maps.isNotEmpty) {
//       for (int i = 0; i < maps.length; i++) {
//         users.add(User.fromMap(maps[i] as Map<String, dynamic>));
//       }
//     }
//     return users.toList();
//   }
//
//   Future<int> delete(int? id) async {
//     var dbClient = (await db)!;
//     return await dbClient.delete(tABLE, where: '$iD = ?', whereArgs: [id]);
//   }
//
//   Future<int> update(User user) async {
//     var dbClient = (await db)!;
//     return await dbClient.update(tABLE, user.toMap(),
//         where: '$iD = ?', whereArgs: [user.id]);
//   }
//
//   Future close() async {
//     var dbClient = (await db)!;
//     dbClient.close();
//   }
// }
