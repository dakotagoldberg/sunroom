class Session {
  final String startTime;
  final String endTime;
  final List sites;

  Session(
      {required this.startTime, required this.endTime, required this.sites});
}

List<Session> sample_sessions = [
  Session(
    startTime: DateTime.now().toIso8601String(),
    endTime: DateTime.now()
        .add(const Duration(minutes: 30, seconds: 2))
        .toIso8601String(),
    sites: [],
  ),
  Session(
    startTime: DateTime.now()
        .subtract(const Duration(days: 1, hours: 34, minutes: 20, seconds: 44))
        .toIso8601String(),
    endTime: DateTime.now()
        .subtract(const Duration(days: 1, hours: 34, minutes: 20, seconds: 44))
        .add(const Duration(minutes: 20, seconds: 44))
        .toIso8601String(),
    sites: [],
  ),
];
