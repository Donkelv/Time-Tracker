List<Map<String, dynamic>> manipulateResponse(
    List<Map<String, dynamic>> responseData) {
  List<Map<String, dynamic>> result = [];

  Map<String, dynamic> dailyData = extractData(responseData, 'daily');
  Map<String, dynamic> monthlyData = extractData(responseData, 'monthly');
  Map<String, dynamic> weeklyData = extractData(responseData, 'weekly');

  result.add(createArray('daily', dailyData));
  result.add(createArray('monthly', monthlyData));
  result.add(createArray('weekly', weeklyData));

  return result;
}

Map<String, dynamic> extractData(
    List<Map<String, dynamic>> responseData, String category) {
  Map<String, dynamic> categoryData = {};

  for (var item in responseData) {
    categoryData[item['title']] = item['timeframes'][category];
  }

  return categoryData;
}

Map<String, dynamic> createArray(
    String category, Map<String, dynamic> categoryData) {
  List<Map<String, dynamic>> array = [];

  for (var title in categoryData.keys) {
    array.add({
      'title': title,
      'timeSpent': categoryData[title],
    });
  }

  return {'category': category, 'data': array};
}
