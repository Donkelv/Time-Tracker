class TimeSpentUtils {
  static double calculatePercentageChange(int current, int previous) {
    if (previous == 0) {
      return double.infinity;
    }

    double percentageChange = ((current - previous) / previous) * 100.0;

    return percentageChange;
  }

  static String calculateGrowthOrDrop(int current, int previous) {
    double percentageChange = calculatePercentageChange(current, previous);

    if (percentageChange.isInfinite) {
      return '+0';
    } else if (percentageChange > 0) {
      return '+${percentageChange.toStringAsFixed(2)}%';
    } else if (percentageChange < 0) {
      return '${percentageChange.toStringAsFixed(2)}%';
    } else {
      return '';
    }
  }
}
