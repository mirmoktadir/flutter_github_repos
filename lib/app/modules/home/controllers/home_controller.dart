import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/foundation.dart';
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
    var isCacheExist = await APICacheManager().isAPICacheKeyExist("RepoDB");
    if (!isCacheExist) {
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
          if (kDebugMode) {
            print("URL: HIT");
          }
          var targetedData = response.data["items"];
          APICacheDBModel cacheDBModel = APICacheDBModel(
              key: "RepoDB", syncData: jsonEncode(targetedData));
          APICacheManager().addCacheData(cacheDBModel);
          // api done successfully
          repoList.assignAll(
              (targetedData as List).map((e) => Items.fromJson(e)).toList());
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
    } else {
      apiCallStatus = ApiCallStatus.loading;
      update();
      var cacheData = await APICacheManager().getCacheData("RepoDB");
      if (kDebugMode) {
        print("CACHE: HIT");
      }
      var localData = jsonDecode(cacheData.syncData);
      apiCallStatus = ApiCallStatus.success;
      update();
      return repoList.assignAll(
          (localData as List).map((e) => Items.fromJson(e)).toList());
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
