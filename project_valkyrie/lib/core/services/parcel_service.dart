import 'dart:convert';

import 'package:project_valkyrie/core/data_models/parcel.dart';
import 'package:project_valkyrie/core/services/backend_rest_api.dart';

class ParcelService {
  final BackendRestApi _api;
  final String _path = '/parcels';
  ParcelService({BackendRestApi api}) : _api = api;

  Future<List<Parcel>> getAllParcels() async {
    List<Parcel> parcels = new List<Parcel>();
    final response = await _api.get(_path);
    if (response.statusCode == 200) {
      Iterable body = json.decode(response.body);
      parcels = body.map((model) => Parcel.fromJson(model)).toList();
    } else {
      // throw an exception, just for testing
      throw Exception('Failed to load all parcels from server');
    }
    return parcels;
  }
}