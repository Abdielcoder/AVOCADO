import 'package:flutter_delivery_udemy/src/models/mercado_pago_credentials.dart';

class Environment {

  static const String API_DELIVERY = "3.217.149.82:3233";
  static const String API_KEY_MAPS = "AIzaSyAxip-78Cucl0wl2x7gF4F4MP_UhtC7iDw";

  static MercadoPagoCredentials mercadoPagoCredentials = MercadoPagoCredentials(
      publicKey: 'TEST-98db4d5d-663a-453b-858e-f66dfd623666',
      accessToken: 'TEST-6028900970379574-062302-e3e5d11b7871ee742832e6351694608f-191014229'
  );

}