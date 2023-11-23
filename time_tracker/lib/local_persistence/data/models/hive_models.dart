// // Define the Hive model classes

// import 'package:hive/hive.dart';

// part 'hive_models.g.dart';

// @HiveType(typeId: 0)
// class TimeSpent {
//   @HiveField(0)
//   late int current;

//   @HiveField(1)
//   late int previous;

//   TimeSpent({required this.current, required this.previous});
// }

// @HiveType(typeId: 1)
// class CategoryData {
//   @HiveField(0)
//   late String title;

//   @HiveField(1)
//   late TimeSpent timeSpent;

//   CategoryData({required this.title, required this.timeSpent});
// }

// @HiveType(typeId: 2)
// class Category {
//   @HiveField(0)
//   late String category;

//   @HiveField(1)
//   late List<CategoryData> data;

//   Category({required this.category, required this.data});
// }
