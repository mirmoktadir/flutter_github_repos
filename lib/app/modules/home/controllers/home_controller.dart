import 'package:flutter_github_repos/app/data/models/github_repos_model.dart';
import 'package:get/get.dart';
import '../../../services/api.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  // hold data
  final repoList = RxList<Items>();
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
      queryParameters: {
        "q": "Flutter",
        "sort": "stars",
        "order": "desc",
        "per_page": "10"
      },
      onSuccess: (response) {
        // api done successfully

        repoList.assignAll((response.data["items"] as List)
            .map((e) => Items.fromJson(e))
            .toList());
        // -) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automatically handle error and show message
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
