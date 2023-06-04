/// 薬の種類
enum MedicineType {
  medicineInside('内用薬'),
  medicineOutSide('外用薬'),
  medicineSingleDosage('頓服薬');

  const MedicineType(this.displayName);
  final String displayName;
}

/// 服用回数
enum MedicineTakingType {
  dailyOnce('1日1回'),
  dailyTwo('1日2回'),
  dailyThree('1日3回'),
  singleDosage('痛みがある時');

  const MedicineTakingType(this.displayName);
  final String displayName;
}
