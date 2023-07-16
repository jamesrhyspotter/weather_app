String formatDateTime(DateTime dateTime) {
  final weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final dayOfWeek = weekdays[dateTime.weekday - 1];
  final dayOfMonth = dateTime.day;
  final month = months[dateTime.month - 1];

  return '$dayOfWeek, $dayOfMonth $month';
}
