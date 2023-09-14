import 'dart:async';

class PlaceBloc {
  final _placeController = StreamController();
  // ignore: non_constant_identifier_names
  Stream get PlaceStream => _placeController.stream;

  void searchPlace(String keyword) {
    _placeController.sink.add('start');
    // PlaceService
  }


}