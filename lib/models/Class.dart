class Class {
  late int? _classId;
  late final String _classDescription;
  late final int _classLevel;
  late final String _className;
  late final String _dateOfClass;
  late final int _estimatedCalories;
  late final String _tags;
  late final int _duration;
  late final String _startTime;
  late final String _endTime;
  late final String _youtube;
  late final double _pricePerClass;

  Class(dynamic obj) {
    _classId = obj['classId'];
    _classDescription = obj['classDescription'];
    _className = obj['className'];
    _classLevel = obj['classLevel'];
    _dateOfClass = obj['dateOfClass'];
    _estimatedCalories = obj['estimatedCalories'];
    _duration = obj['duration'];
    _tags = obj['tags'];
    _startTime = obj['startTime'];
    _endTime = obj['endTime'];
    _youtube=obj['youtube'];
    _pricePerClass = obj['pricePerClass'];
  }

  Class.fromMap(Map<String, dynamic> data) {
    _classId = data['classId'];
    _classDescription = data['classDescription'];
    _className = data['className'];
    _classLevel = data['classLevel'];
    _dateOfClass = data['dateOfClass'];
    _estimatedCalories = data['estimatedCalories'];
    _duration = data['duration'];
    _tags = data['tags'];
    _startTime = data['startTime'];
    _endTime = data['endTime'];
   // _youtube=data['youtube'];
    _pricePerClass = data['pricePerClass'];
  }

  Map<String, dynamic> toMap() => {
        'classid': _classId,
        'classDescription': _classDescription,
        'className': _className,
        'classLevel': _classLevel,
        'dateOfClass': _dateOfClass,
        'estimatedCalories': _estimatedCalories,
        'duration': _duration,
        'tags': _tags,
        'startTime': _startTime,
        'endTime': _endTime,
        'youtube':_youtube,
        'pricePerClass': _pricePerClass,
      };

  int? get classId => _classId;
  String get classDescription => _classDescription;
  String get className => _className;
  int get classLevel => _classLevel;
  String get dateOfClass => _dateOfClass;
  int get estimatedCalories => _estimatedCalories;
  int get duration => _duration;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String? get youtube => _youtube;
  String? get tags => _tags;
  double? get pricePerClass => _pricePerClass;
}
