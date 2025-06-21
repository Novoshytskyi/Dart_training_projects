class Data {
  final Map<String, dynamic> dataMap;

  Data({
    required this.dataMap,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      dataMap: json,
    );
  }
}

class Condition {
  final dynamic include;
  final dynamic exclude;
  final List sortBy;

  Condition({
    this.include,
    this.exclude,
    required this.sortBy,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      include: json["include"] as dynamic,
      exclude: json["exclude"] as dynamic,
      sortBy: json["sort_by"] as List,
    );
  }
}

class Result {
  final List<Data> datas;
  final Condition condition;

  Result({
    required this.datas,
    required this.condition,
  });

  final List<Data> _selectedData = [];
  late String _keyOfCondition;
  late String _valueOfCondition;
  late String _valueOfData;
  late bool _dataContainsKeyOfCondition;
  final List<String> _dataForOutList = [];

  void _selectDataIfConditionInclude() {
    for (final data in datas) {
      //
      if (condition.include != null) {
        for (final condInclude in condition.include) {
          _keyOfCondition = condInclude.keys.toList()[0];
          _valueOfCondition = condInclude[_keyOfCondition].toString();
          _valueOfData = data.dataMap[_keyOfCondition].toString();
          _dataContainsKeyOfCondition =
              data.dataMap.keys.toList().contains(_keyOfCondition);

          if (_dataContainsKeyOfCondition &&
              _valueOfCondition == _valueOfData) {
            _selectedData.add(data);
          }
        }
      }
    }
  }

  String _sortByString() {
    return condition.sortBy.toList()[0].toString();
  }

  void _selectedDataSort() {
    _selectedData.sort(
      (a, b) =>
          (a.dataMap[_sortByString()]).compareTo(b.dataMap[_sortByString()]),
    );
  }

  void _dataForOutListAddData() {
    for (final data in _selectedData) {
      _dataForOutList.add(data.dataMap.toString());
    }
  }

  String get result {
    _selectDataIfConditionInclude();
    _selectedDataSort();
    _dataForOutListAddData();
    return '{"result": ${_dataForOutList.toString()}}';
  }
}

extension SelectionDataIfConditionExclude on Result {
  void _selectDataIfConditionExclude() {
    List<String> valuesOfConditionList = [];
    if (condition.exclude != null) {
      for (final condExclude in condition.exclude) {
        _keyOfCondition = condExclude.keys.toList()[0];
        valuesOfConditionList.add(condExclude[_keyOfCondition].toString());
      }
      for (final data in datas) {
        if (!valuesOfConditionList
            .contains(data.dataMap[_keyOfCondition].toString())) {
          _selectedData.add(data);
        }
      }
    }
  }

  String get extendetResult {
    _selectDataIfConditionInclude();
    _selectDataIfConditionExclude(); //added!
    _selectedDataSort();
    _dataForOutListAddData();

    return '{"result": ${_dataForOutList.toString()}}';
  }
}
