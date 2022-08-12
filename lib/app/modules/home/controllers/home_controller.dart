import 'package:flutter_github_repos/app/data/models/github_repos_model.dart';
import 'package:get/get.dart';

import '../../../services/api.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  // hold data
  final repos = RxList<Items>();
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // getting data from api simulating
  getData() async {
    // *) indicate loading state
    apiCallStatus = ApiCallStatus.loading;
    update();
    // *) perform api call
    await BaseClient.get(
      API.baseUrl, // url
      onSuccess: (response) {
        // api done successfully
        repos.assignAll(
            (response.data as List).map((e) => Items.fromJson(e)).toList());
        // -) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you dont pass this method base client
      // will automaticly handle error and show message
      onError: (error) {
        // show error message to user

        BaseClient.handleApiError(error);
        // -) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      }, // error while performing request
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
