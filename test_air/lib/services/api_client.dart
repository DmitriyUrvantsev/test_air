// import 'dart:convert';
// import 'dart:io';

// import '../domain/offers.dart';

// enum ApiClientExeptionType { network, auth, other, sessionExpired }

// class ApiClientExeption implements Exception {
//   final ApiClientExeptionType type;
//   ApiClientExeption({
//     required this.type,
//   });
// }

// class ApiClient {
//   final client = HttpClient();

//   Future<Offer> getOffersPost() async {
//     final url = Uri.parse(
//         'https://run.mocky.io/v3/00727197-24ae-48a0-bcb3-63eb35d7a9de');

//     try {
//       final request = await client.getUrl(url);
//       final respons = await request.close();

//       final jsonMaps = await respons.transform(utf8.decoder).toList();
//       final jsonMap = jsonMaps.join();
//       final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;
//       // _validateResponse(respons, resultFile); //!ПРОВЕРКА

//       final result = Offer.fromJson(resultFile);
//       print(' result!!!!!! ${result.id}');
//       return result;
//     } //---------------------\\\\\-------
//     on SocketException {
//       throw ApiClientExeption(type: ApiClientExeptionType.network);
//     } on ApiClientExeption {
//       rethrow;
//     } catch (_) {
//       throw ApiClientExeption(type: ApiClientExeptionType.other);
//     }
//   }

//   // Future<Apartment> getApartmentPost() async {
//   //   final url = Uri.parse(
//   //       'https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195');

//   //   try {
//   //     final request = await client.getUrl(url);
//   //     final respons = await request.close();

//   //     final jsonMaps = await respons.transform(utf8.decoder).toList();
//   //     final jsonMap = jsonMaps.join();
//   //     final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;
//   //     _validateResponse(respons, resultFile); //!ПРОВЕРКА

//   //     final result = Apartment.fromJson(resultFile);
//   //     return result;
//   //   } //---------------------\\\\\-------
//   //   on SocketException {
//   //     throw ApiClientExeption(type: ApiClientExeptionType.network);
//   //   } on ApiClientExeption {
//   //     rethrow;
//   //   } catch (_) {
//   //     throw ApiClientExeption(type: ApiClientExeptionType.other);
//   //   }
//   // }

//   // Future<ApartmentData> getApartmentDataPost() async {
//   //   final url = Uri.parse(
//   //       'https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');

//   //   try {
//   //     final request = await client.getUrl(url);
//   //     final respons = await request.close();

//   //     final jsonMaps = await respons.transform(utf8.decoder).toList();
//   //     final jsonMap = jsonMaps.join();
//   //     final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;
//   //     _validateResponse(respons, resultFile); //!ПРОВЕРКА

//   //     final result = ApartmentData.fromJson(resultFile);
//   //     return result;
//   //   } //---------------------\\\\\-------
//   //   on SocketException {
//   //     throw ApiClientExeption(type: ApiClientExeptionType.network);
//   //   } on ApiClientExeption {
//   //     rethrow;
//   //   } catch (_) {
//   //     throw ApiClientExeption(type: ApiClientExeptionType.other);
//   //   }
//   // }

// //==================================================
//   void _validateResponse(
//       //хелпер проверки
//       HttpClientResponse respons,
//       Map<String, dynamic> json) {
//     if (respons.statusCode == 401) {
//       final dynamic status = json['status_code'];
//       final code = status is int ? status : 0;
//       if (code == 30) {
//         //! нужно уточнить
//         //?когда не верный логин пароль
//         throw ApiClientExeption(type: ApiClientExeptionType.auth);
//       } else if (code == 3) {
//         //! нужно уточнить
//         //? когда не верный sessionId
//         throw ApiClientExeption(type: ApiClientExeptionType.sessionExpired);
//       } else {
//         throw ApiClientExeption(type: ApiClientExeptionType.other);
//       }
//     }
//   }
// }



import 'dart:convert';
import 'dart:io';

import '../domain/all_tickets.dart';
import '../domain/offer.dart';
import '../domain/offers_tickets.dart';

enum ApiClientExceptionType { network, auth, other, sessionExpired } 

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  
  ApiClientException({
    required this.type,
  });
}

class ApiClient {
  final client = HttpClient();

  Future<Offer> getOffersPost() async {
    final url = Uri.parse('https://run.mocky.io/v3/00727197-24ae-48a0-bcb3-63eb35d7a9de');

    try {
      final request = await client.getUrl(url);
      final response = await request.close();

      final jsonMap = await utf8.decodeStream(response); 
      final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;

      _validateResponse(response, resultFile);

      final result = Offer.fromJson(resultFile);
     
      return result;
    } on SocketException {
      throw ApiClientException(type: ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(type: ApiClientExceptionType.other);
    }
  }

  Future<OffersTickets> getOffersTicketsPost() async {
    final url = Uri.parse('https://run.mocky.io/v3/3424132d-a51a-4613-b6c9-42b2d214f35f');

    try {
      final request = await client.getUrl(url);
      final response = await request.close();

      final jsonMap = await utf8.decodeStream(response); 
      final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;

      _validateResponse(response, resultFile);

      final result = OffersTickets.fromJson(resultFile);
     
      return result;
    } on SocketException {
      throw ApiClientException(type: ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(type: ApiClientExceptionType.other);
    }
  }

  Future<AllTickets> getAllTicketsPost() async {
    final url = Uri.parse('https://run.mocky.io/v3/2dbc0999-86bf-4c08-8671-bac4b7a5f7eb');

    try {
      final request = await client.getUrl(url);
      final response = await request.close();

      final jsonMap = await utf8.decodeStream(response); 
      final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;

      _validateResponse(response, resultFile);

      final result = AllTickets.fromJson(resultFile);
     
      return result;
    } on SocketException {
      throw ApiClientException(type: ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(type: ApiClientExceptionType.other);
    }
  }

  void _validateResponse(HttpClientResponse response, Map<String, dynamic> json) {
    if (response.statusCode == 401) {
      final dynamic statusCode = json['status_code']; // Заменил "status" на "status_code"
      final code = statusCode is int ? statusCode : 0;
      if (code == 30) {
        throw ApiClientException(type: ApiClientExceptionType.auth);
      } else if (code == 3) {
        throw ApiClientException(type: ApiClientExceptionType.sessionExpired);
      } else {
        throw ApiClientException(type: ApiClientExceptionType.other);
      }
    }
  }
}
