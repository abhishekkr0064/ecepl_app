import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ecepl_app/Data/Network/app_exception.dart';
import 'package:ecepl_app/Data/Network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {
  // ─────────────────────────── HEADERS ───────────────────────────

  Map<String, String> _buildHeaders(Map<String, String>? headers) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (headers != null) ...headers,
    };
  }

  // ─────────────────────────── CORE REQUEST ───────────────────────────

  Future<dynamic> _handleRequest({
    required String method,
    required String url,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final finalHeaders = _buildHeaders(headers);
      http.Response response;

      switch (method) {
        case "GET":
          response = await http
              .get(Uri.parse(url), headers: finalHeaders)
              .timeout(const Duration(seconds: 50));
          break;
        case "POST":
          response = await http
              .post(
                Uri.parse(url),
                headers: finalHeaders,
                body: jsonEncode(body),
              )
              .timeout(const Duration(seconds: 50));
          break;
        case "PUT":
          response = await http
              .put(
                Uri.parse(url),
                headers: finalHeaders,
                body: jsonEncode(body),
              )
              .timeout(const Duration(seconds: 50));
          break;
        case "DELETE":
          response = await http
              .delete(Uri.parse(url), headers: finalHeaders)
              .timeout(const Duration(seconds: 50));
          break;
        default:
          throw AppException("Unsupported HTTP method: $method");
      }

      return _returnResponse(response);
    } on AppException {
      rethrow;
    } on SocketException {
      throw AppException(
        "No internet connection",
        type: ExceptionType.noInternet,
      );
    } on TimeoutException {
      throw AppException("Request timed out", type: ExceptionType.timeout);
    } catch (e) {
      throw AppException("Unexpected error: ${e.toString()}");
    }
  }

  // ─────────────────────────── PUBLIC METHODS ───────────────────────────

  // ======================= GET Request =======================
  @override
  Future<dynamic> getApi(String url, {Map<String, String>? headers}) =>
      _handleRequest(method: "GET", url: url, headers: headers);

  // ======================= POST Request =======================
  @override
  Future<dynamic> postApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  }) => _handleRequest(method: "POST", url: url, body: data, headers: headers);

  // ======================= PUT Request =======================
  @override
  Future<dynamic> putJsonApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  }) => _handleRequest(method: "PUT", url: url, body: data, headers: headers);

  // ======================= DELETE Request =======================
  @override
  Future<dynamic> deleteApi(String url, {Map<String, String>? headers}) =>
      _handleRequest(method: "DELETE", url: url, headers: headers);

  // ─────────────────────────── RESPONSE HANDLER ───────────────────────────

  dynamic _returnResponse(http.Response response) {
    if (response.body.trim().startsWith("<")) {
      throw AppException("Server returned HTML instead of JSON");
    }

    final body = response.body.isNotEmpty ? jsonDecode(response.body) : null;

    if ((response.statusCode == 200 || response.statusCode == 201) &&
        body is Map &&
        body['status'] == false) {
      throw AppException(
        body['message']?.toString() ?? "Something went wrong",
        type: ExceptionType.serverError,
      );
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return body;
      case 400:
        throw AppException(
          body?['message'] ?? "Bad Request",
          type: ExceptionType.badRequest,
        );
      case 401:
        throw AppException(
          body?['message'] ?? "Unauthorized",
          type: ExceptionType.unauthorized,
        );
      case 403:
        throw AppException(
          body?['message'] ?? "Access denied",
          type: ExceptionType.forbidden,
        );
      case 404:
        throw AppException(
          body?['message'] ?? "URL not found",
          type: ExceptionType.notFound,
        );
      case 500:
        throw AppException(
          body?['message'] ?? "Internal Server Error",
          type: ExceptionType.serverError,
        );
      default:
        throw AppException(
          body?['message'] ?? "Unexpected Error: ${response.statusCode}",
          type: ExceptionType.unknown,
        );
    }
  }
}
