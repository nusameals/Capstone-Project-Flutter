import 'package:flutter/foundation.dart';
import 'package:nusameals/model/api/mytable_api.dart';
import 'package:nusameals/model/mytable_model.dart';

class myTableViewModel extends ChangeNotifier {
  List<myTable> _tables = [];
  List<myTable> get tables => _tables;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchTables() async {
    try {
      _isLoading = true;
      notifyListeners();

      var api = myTableAPI();
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
