import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/data_models/parcel.dart';
import 'package:project_valkyrie/core/services/parcel_service.dart';
import 'package:project_valkyrie/core/view_models/base_view_model.dart';

class ParcelsViewModel extends BaseViewModel {
  ParcelService _parcelsService;
  Map<String, Parcel> _parcels = new Map<String, Parcel>();
  // For Testing Only
  Map<String, String> _collection = new Map<String, String>();
  ParcelsViewModel({@required ParcelService parcelsService})
      : _parcelsService = parcelsService {
    initItem();
  }

  void initItem() {
    /* _collection = <String, String>{
      'ADL000119': '2019.08.10 front desk',
      'ADL000120': '2019.09.15 front desk',
      'ADL000121': '2019.10.1 front desk',
      'ADL000122': '2019.10.10 front desk',
      'ADL000123': '2019.10.12 parcel locker',
      'ADL000124': '2019.11.11 front desk',
      'ADL000125': '2019.12.1 parcel locker',
      'ADL000126': '2019.12.10 parcel locker',
      'ADL000127': '2019.12.15 front desk',
    }; */
    this.setBusy(true);
    this._fetchFromServer();
  }

  void _fetchFromServer() async {
    List<Parcel> parcels = await _parcelsService.getAllParcels();
    log('Number of parcels: ${parcels.length}');
    parcels.forEach((parcel) {
      log('${parcel.id} - ${parcel.location} - ${parcel.deliverTime.toString()}');
      final key = '${parcel.id}';
      final val = parcel.trackingNumber;
      _collection[key] = val;
      _parcels[key] = parcel;
    });
    log('collection: ' + _collection.toString());
    this.setBusy(false);
  }

  void addItem(item) {
    //collection.add(item);
    notifyListeners();
  }

  void removeItem(item) {
    //collection.remove(item);
    notifyListeners();
  }

  bool isPickedUp (item) {
    if (_parcels.containsKey(item)) {
      return _parcels[item].isPickedUp;
    }
    return false;
  }

  bool containsItem(item) {
    return _collection.containsKey(item);
  }

  Map<String, String> getData() {
    log('Collection: ' + _collection.toString());
    return _collection;
  }
}
