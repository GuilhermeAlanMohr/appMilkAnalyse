import 'dart:io';

import 'package:appmilkanalyse/model/analysis.dart';
import 'package:appmilkanalyse/model/farm.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

class AnalysisDAO {

  static final List<Analysis> _listAnalysis = [];

  static get populaAnalysis async{

    // Position position = await requestLocation();
    //
    // Analysis a = Analysis(1, "Amostra 1", DateTime.now(), "Não apresenta alterações", "Animal não apresenta mastite", 200,
    //     10, "Não apresenta resíduos", "Sabor apresenta leve alteração", "Coloração normal", "Não apresenta odor",
    //     "Viscosidade normal", "Conservação é realizada de forma correta",
    //     Farm(1, 'Dourados', 'Pedro Ribeiro', 'Santa Maria/RS', 20, 10, position), "images/farm.jpg");
    //
    // Analysis a1 = Analysis(2, "Amostra 2", DateTime.now(), "Não apresenta alterações", "Animal não apresenta mastite", 120,
    //     12, "Não apresenta resíduos", "Sabor não apresenta alteração", "Coloração anormal", "Apresenta odor leve",
    //     "Viscosidade normal", "Conservação é realizada de forma correta",
    //     Farm(2, 'Baú do Ouro', 'João dos Santos', 'Venâncio Aires/RS', 35, 15, position), "images/farm2.jpg");
    //
    // AnalysisDAO.adicionar(a);
    // AnalysisDAO.adicionar(a1);
  }

  static get listarAnalysis {

    return _listAnalysis;

  }

  static adicionar(Analysis a) {
    // debugPrint(a.toString());
    // _listAnalysis.add(a);
    // debugPrint("Tamanho lista = "+_listAnalysis.length.toString());
  }

  // static Future<Position> requestLocation() async {
    // bool serviceEnabled;
    // LocationPermission permission;
    //
    // // Test if location services are enabled.
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   return Future.error('Location services are disabled.');
    // }
    //
    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     // Permissions are denied, next time you could try
    //     // requesting permissions again (this is also where
    //     // Android's shouldShowRequestPermissionRationale
    //     // returned true. According to Android guidelines
    //     // your App should show an explanatory UI now.
    //     return Future.error('Location permissions are denied');
    //   }
    // }
    //
    // if (permission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }
    //
    // // When we reach here, permissions are granted and we can
    // // continue accessing the position of the device.
    // return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  // }

}