import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/offline_service.dart';

class OfflineContext extends ChangeNotifier {
  final _offlineService = GetIt.I.get<OfflineService>();

  bool _isOffline = false;
  bool get isOffline => _isOffline;

  void init() {
    _isOffline = _offlineService.isOffline;
    notifyListeners();
  }

  Future<void> setOffline(bool value) async {
    _isOffline = value;
    notifyListeners();
    await _offlineService.setOffline(value);
  }
}
