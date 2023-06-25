import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nusameals/model/api/reservation_api.dart';
import 'package:nusameals/model/reservation_model.dart';

class ReservationViewModel extends ChangeNotifier {
  List<ReservationModel> _reservations = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<ReservationModel> get reservations => _reservations;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void fetchReservations() async {
    try {
      _isLoading = true;
      _reservations.clear();

      var api = ReservationAPI();
      _reservations = await api.getReservation();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load reservations: $e';
      notifyListeners();
    }
  }
}
