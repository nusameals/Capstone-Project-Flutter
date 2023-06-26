import 'package:flutter/foundation.dart';
import 'package:nusameals/model/api/mytable_api.dart';
import 'package:nusameals/model/mytable_model.dart';

class MyTableViewModel extends ChangeNotifier {
  List<MyTable> _tables = [];
  List<MyTable> get tables => _tables;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchTables() async {
    try {
      _isLoading = true;
      notifyListeners();

      var api = MyTableAPI();
      _tables = await api.getmyTable();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $error');
    }
  }
}
