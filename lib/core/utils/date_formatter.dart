class DateFormatter {
  static const List<String> _monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static String formatRelative(DateTime date) {
    final now = DateTime.now();

    if (_isSameDay(date, now)) {
      return 'Today';
    }

    final yesterday = now.subtract(const Duration(days: 1));
    if (_isSameDay(date, yesterday)) {
      return 'Yesterday';
    }

    return '${date.day} ${_monthNames[date.month - 1]}';
  }

  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
