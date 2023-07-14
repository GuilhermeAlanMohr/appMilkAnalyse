import 'package:appmilkanalyse/model/farm.dart';
import 'package:geolocator/geolocator.dart';

class FarmDAO {

  static final List<Farm> _listFarms = [];

  static get listarFarms {

    return _listFarms;

  }

  static adicionar(Farm f) {
    // _listFarms.add(f);
  }

  static get populaFarms async{

    // Position position = await requestLocation();
    // Farm f = Farm(1, 'Dourados', 'Pedro Ribeiro', 'Santa Maria/RS', 20, 10, position);
    // Farm f1 = Farm(2, 'Baú do Ouro', 'João dos Santos', 'Venâncio Aires/RS', 35, 15, position);
    // Farm f2 = Farm(3, 'Recanto do Alemão', 'Fernando Cardoso', 'Santa Cruz do Sul/RS', 24, 12, position);
    // Farm f3 = Farm(4, 'Pintado', 'Leonardo Medeiros', 'Venâncio Aires/RS', 10, 8, position);
    //
    // FarmDAO.adicionar(f);
    // FarmDAO.adicionar(f1);
    // FarmDAO.adicionar(f2);
    // FarmDAO.adicionar(f3);
  }

  static Future<Position> requestLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }

}