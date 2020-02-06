import 'dart:convert';
import 'dart:io';

import 'package:demo_app/data/auth/datasource/session_manager.dart';
import 'package:demo_app/models/response_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class NetworkClient {
  Future<ResponseData> get(String url, {Map<String, String> headers});

  Future<ResponseData> post(String url, {Map<String, String> header, body, Encoding encoding});

  Future<ResponseData> put(String url, {Map<String, String> header, body, Encoding encoding});

  Future<ResponseData> delete(String url, {Map<String, String> header});

  Future<http.Response> postMultipart(String url, 
    {Map<String, String> headers, Map<String, String> body, String fileField, File file, Encoding encoding});
}

class NetworkClientImpl extends NetworkClient {
  final http.Client client;
  final SessionManager sessionManager;

  NetworkClientImpl({@required this.client, @required this.sessionManager});

  @override
  Future<ResponseData> get(String url, {Map<String, String> headers}) {
    final uri = Uri.encodeFull(url);
    final request = () async =>
      client.get(uri, headers: await _addServiceHeaders(headers));
    return null;
  }

  @override
  Future<ResponseData> post(String url, {Map<String, String> header, body, Encoding encoding}) {
    return null;
  }

  @override
  Future<ResponseData> delete(String url, {Map<String, String> header}) {
    return null;
  }

  @override
  Future<http.Response> postMultipart(String url, {Map<String, String> headers, Map<String, String> body, String fileField, File file, Encoding encoding}) {
    return null;
  }

  @override
  Future<ResponseData> put(String url, {Map<String, String> header, body, Encoding encoding}) {
    return null;
  }
  
  Future<String> _getAuthorizationToken() async {
    return (await sessionManager.getSession())?.token ?? '';
  }

  Future<Map<String, String>> _addServiceHeaders(Map<String, String> headers) async {
    final String token = await _getAuthorizationToken();
    final Map<String, String> resultHeaders = Map();
    if(token != null)
      resultHeaders[HttpHeaders.authorizationHeader] = token;
    if(headers != null)
      resultHeaders.addAll(headers);
    return resultHeaders;
  }

}