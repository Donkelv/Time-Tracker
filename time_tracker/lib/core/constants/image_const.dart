import 'package:time_tracker/core/constants/string_extension.dart';

class ImageConst {
  String errorGifWhite = StringExtensions("error_white").gif;
  String errorGifDark = StringExtensions("error_dark").gif;
  String ellipsisIcon = StringExtensions("icon-ellipsis").svg;
  String exerciseIcon = StringExtensions("icon-exercise").svg;
  String playIcon = StringExtensions("icon-play").svg;
  String selfCareIcon = StringExtensions("icon-self-care").svg;
  String socialIcon = StringExtensions("icon-social").svg;
  String studyIcon = StringExtensions("icon-study").svg;
  String workIcon = StringExtensions("icon-work").svg;

  String profileIcon = StringExtensions("profile").png;

  String getTimeFrameIcon(String title) {
    switch (title.toLowerCase()) {
      case 'work':
        return workIcon;
      case 'play':
        return playIcon;
      case 'study':
        return studyIcon;
      case 'exercise':
        return exerciseIcon;
      case 'social':
        return socialIcon;
      case 'self care':
        return selfCareIcon;

      default:
        throw ArgumentError('Invalid category name: $title');
    }
  }
}
