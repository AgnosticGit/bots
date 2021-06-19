import 'dart:convert';
import 'package:bots/services/internet.service.dart';
import 'package:bots/utils/enums.dart';
import 'package:http/http.dart' as http;

class RestApiService<S, E> extends InternetService {
  RestApiService({
    required this.url,
    required this.requestType,
    this.successFromJson,
    this.successToStore,
    this.errorsFromJson,
    this.errorsToStore,
    this.setIsDisconnected,
    this.setIsLoading,
  });

  String url;
  RequestType requestType;

  S Function(dynamic responseBody)? successFromJson;
  E Function(dynamic errors)? errorsFromJson;

  void Function(S data)? successToStore;
  void Function(E error)? errorsToStore;

  Function(bool)? setIsDisconnected;
  Function(bool)? setIsLoading;

  Future request<S, E>() async {
    if (!await isConnected()) {
      if (setIsDisconnected != null) {
        setIsDisconnected!(true);
      } else {
        return;
      }
    }

    try {
      _loadingStarted();
      http.Response response = await _httpRequest();
      _loadingFinished();

      if (response.statusCode != 200) {
        throw response.body;
      }
      _successToState(response);
    } catch (errors) {
      _errorsToState(errors);
      _loadingFinished();
    }
  }

  void _successToState(http.Response response) {
    if (successToStore != null && successFromJson != null) {
      final json = jsonDecode(response.body);
      successToStore!(successFromJson!(json));
    }
  }

  void _errorsToState(Object errors) {}

  void _loadingStarted() {
    if (setIsLoading != null) setIsLoading!(true);
  }

  void _loadingFinished() {
    if (setIsLoading != null) setIsLoading!(false);
  }

  Future<http.Response> _httpRequest() async {
    if (requestType == RequestType.get) {
      return await http.get(Uri.parse(url));
    }
    if (requestType == RequestType.post) {
      return await http.post(Uri.parse(url));
    }
    if (requestType == RequestType.put) {
      return await http.put(Uri.parse(url));
    }

    return await http.delete(Uri.parse(url));
  }
}
