class StringConst {
  static const connectionException = "Exception connecting to the internet";

  static String getTimeFrame(String category) {
   
    switch (category.toLowerCase()) {
      case 'daily':
        return "Yesterday";
      case 'weekly':
        return "Last Week";
      case 'monthly':
        return "Last Month";

      default:
        throw ArgumentError('Invalid category name: $category');
    }
  }
}
