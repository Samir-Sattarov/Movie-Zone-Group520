class DateTimeHelper {
  static getFormattedDurationFromMinute(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;

    return "${hour}h ${minute}m";
  }
}
