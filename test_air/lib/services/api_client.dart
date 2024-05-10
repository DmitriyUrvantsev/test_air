
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
