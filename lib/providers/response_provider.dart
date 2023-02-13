import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/blueprints/api_response.dart';

final responseProvider =
    StateNotifierProvider<ResponseProvider, ResponseStatus>(
  (_) => ResponseProvider(ResponseStatus()),
);

class ResponseProvider extends StateNotifier<ResponseStatus> {
  ResponseProvider(ResponseStatus state) : super(state);

  setResponse(ResponseStatus response) => state = response;
}
