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
    sites: example_session,
  ),
  Session(
    startTime: DateTime.now()
        .subtract(const Duration(days: 1, hours: 34, minutes: 20, seconds: 44))
        .toIso8601String(),
    endTime: DateTime.now()
        .subtract(const Duration(days: 1, hours: 34, minutes: 20, seconds: 44))
        .add(const Duration(minutes: 20, seconds: 44))
        .toIso8601String(),
    sites: example_session_2,
  ),
];

List example_session = [
  {
    'site': 'YouTube',
    'title': 'Building Top Secret Underground Bunker out of an F350',
    'tags': ['duramax', 'bunker', 'shelter', 'secret', 'top secret'],
    'duration': 2699
  },
  {
    'site': 'YouTube',
    'title':
        'Ripping Apart My AnyLevel F350 with the Excavator (digging up the bunker)',
    'tags': ['f350 f150 f250 ford chevy', 'f150', 'f250', 'f350', 'ford'],
    'duration': 4891
  },
  {
    'site': 'YouTube',
    'title': 'I have 60 days to make this Farmall not exist anymore.',
    'tags': ['WhistlinDiesel', 'Off-road', 'Duramax', 'Powerstroke', 'Truck'],
    'duration': 5013
  },
  {
    'site': 'YouTube',
    'title': 'BURIED SNOWCAT. Most difficult recovery operation ever.',
    'tags': ['duramax', 'trucks', 'whistlindiesel', 'snowcat', 'powerstroke'],
    'duration': 3622
  },
  {
    'site': 'YouTube',
    'title': 'Building Top Secret Underground Bunker out of an F350',
    'tags': ['duramax', 'bunker', 'shelter', 'secret', 'top secret'],
    'duration': 3823
  }
];

List example_session_2 = [
  {
    'site': 'YouTube',
    'title':
        'New Renegade Dance with @Charli D’amelio TikTok Compilation - Best Dance Challenges 2020',
    'tags': [
      'Renegade Dance Challenge',
      'renegade',
      'renegade dance tik tok',
      'renegade dance',
      "charli d'amelio dance"
    ],
    'duration': 16524
  },
  {
    'site': 'YouTube',
    'title': 'How World War I Started: Crash Course World History 209',
    'tags': [
      'World War I',
      'John Green',
      'Archduke Franz Ferdinand',
      'Austria-Hungary',
      'WWI'
    ],
    'duration': 21506
  },
  {
    'site': 'YouTube',
    'title': 'St Petersburg Ballet Theatre - Swan Lake ft Irina Kolesnikova',
    'tags': [
      'Ирина Колесникова',
      'Irina Kolesnikova',
      'SPBT',
      'Tachkin',
      'Konstantin Tachkin'
    ],
    'duration': 38765
  }
];
