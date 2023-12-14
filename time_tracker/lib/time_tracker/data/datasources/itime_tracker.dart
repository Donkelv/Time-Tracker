import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

abstract class ITimeTrackerDataSource  {
   Future<List<CategoryData>> getTimeSpent();
}
