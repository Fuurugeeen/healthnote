import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/prescription/data/models/prescription_entry_model.dart';
import '../../global/log.dart';

class DatabaseService {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'health_note.db');

    // // Todo:開発中は毎回DBを削除する
    // await deleteDatabase(path);

    return openDatabase(
      path,
      onCreate: (db, version) async {
        logger.info('DB onCreate');

        await db.execute(
          '''
            CREATE TABLE medicine (
              id INTEGER PRIMARY KEY
              ,medicineType TEXT
              ,medicineTakingType TEXT
              ,dailyDosageValue INTEGER
              ,dosingPeriodStart TEXT
              ,dosingPeriodEnd TEXT
              ,medicineDetails TEXT
              ,userTakingCnt INTEGER
            )
          ''',
        );
      },
      version: 1,
    );
  }

  /// 薬を登録
  Future<void> insertMedicine(
    PrescriptionEntryModel prescriptionEntryModel,
  ) async {
    final db = await database;

    final id = await db.insert(
      'medicine',
      await prescriptionEntryModel.toDBParam(),
    );

    logger.info('insertMedicine id: $id');
  }

  /// 薬を更新
  Future<void> updateMedicine(
    PrescriptionEntryModel prescriptionEntryModel,
  ) async {
    final db = await database;

    final id = await db.update(
      'medicine',
      await prescriptionEntryModel.toDBParam(),
    );

    logger.info('updateMedicine id: $id');
  }

  /// 薬を取得
  Future<List<PrescriptionEntryModel>> getMedicines() async {
    final db = await database;
    final maps = await db.query(
      'medicine',
    );

    final convItems = <PrescriptionEntryModel>[];
    for (final item in maps) {
      final list = item['medicineDetails'].toString().split(',');

      final copy = {...item};
      copy['medicineDetails'] = list;
      convItems.add(PrescriptionEntryModel.fromJson(copy));
    }

    return convItems;
  }

  Future<void> updatetUserTakingCnt(int id, int userTakingCnt) async {
    final db = await database;
    await db.update(
      'medicine',
      {
        'userTakingCnt': userTakingCnt,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
