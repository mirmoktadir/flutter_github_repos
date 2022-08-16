import 'dart:async';
import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_repos/app/data/local/my_shared_pref.dart';
import 'package:flutter_github_repos/app/data/models/github_repos_model.dart';
import 'package:get/get.dart';
import '../../../services/api.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();

  //At the beginning, we fetch the first 10 repo

  final int _limit = 10;
  int _page = 1;

  bool hasMore = true;
  // hold data
  final repoList = RxList<Items>();
  late Timer timer;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  // getting data from api simulating
  getData() async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist("RepoDB");

    // *) indicate loading state
    apiCallStatus = ApiCallStatus.loading;
    update();
    // *) perform api call
    await BaseClient.get(
      API.baseUrl, // url
      queryParameters: {
        "q": "Flutter",
        "sort": MySharedPref.getSort(),
        "order": "desc",
        "per_page": _limit,
        "page": _page
      },

      onSuccess: (response) {
        if (kDebugMode) {
          print("URL_REGULAR: HIT");
        }
        var targetedData = response.data["items"];
        APICacheDBModel cacheDBModel =
            APICacheDBModel(key: "RepoDB", syncData: jsonEncode(targetedData));
        APICacheManager().addCacheData(cacheDBModel);

        repoList.addAll(
            (targetedData as List).map((e) => Items.fromJson(e)).toList());
        _page++;
        if (repoList.length < _limit) {
          hasMore = false;
        }
        // -) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automatically handle error and show message
      onError: (error) async {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
        if (!isCacheExist) {
          // show error message to user
          BaseClient.handleApiError(error);
          // -) indicate error status
          apiCallStatus = ApiCallStatus.error;
          update();
        } else {
          // *) indicate loading state
          apiCallStatus = ApiCallStatus.loading;
          update();
          var cacheData = await APICacheManager().getCacheData("RepoDB");
          if (kDebugMode) {
            print("CACHE_REGULAR: HIT");
          }
          var localData = jsonDecode(cacheData.syncData);

          repoList.addAll(
              (localData as List).map((e) => Items.fromJson(e)).toList());
          apiCallStatus = ApiCallStatus.success;
          update();
        }
      }, // error while performing request
    );
  }

  scrollGet() async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist("RepoDB");

    await BaseClient.get(
      API.baseUrl, // url
      queryParameters: {
        "q": "Flutter",
        "sort": MySharedPref.getSort(),
        "order": "desc",
        "per_page": _limit,
        "page": _page
      },
      onSuccess: (response) {
        if (kDebugMode) {
          print("URL_SCROLL: HIT");
        }
        var targetedData = response.data["items"];
        APICacheDBModel cacheDBModel =
            APICacheDBModel(key: "RepoDB", syncData: jsonEncode(targetedData));
        APICacheManager().addCacheData(cacheDBModel);

        repoList.addAll(
            (targetedData as List).map((e) => Items.fromJson(e)).toList());
        _page++;
        if (repoList.length < _limit) {
          hasMore = false;
        }

        // -) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      onError: (error) async {
        if (!isCacheExist) {
          // show error message to user
          BaseClient.handleApiError(error);
          // -) indicate error status
          apiCallStatus = ApiCallStatus.error;
          update();
        } else {
          // *) indicate loading state
          apiCallStatus = ApiCallStatus.loading;
          update();
          var cacheData = await APICacheManager().getCacheData("RepoDB");
          if (kDebugMode) {
            print("CACHE_SCROLL: HIT");
          }
          var localData = jsonDecode(cacheData.syncData);

          repoList.addAll(
              (localData as List).map((e) => Items.fromJson(e)).toList());
          _page++;
          if (repoList.length < _limit) {
            hasMore = false;
          }
          apiCallStatus = ApiCallStatus.success;
          update();
        }
      },
    );
  }

  sortAfter() async {
    var isCacheExist = await APICacheManager().isAPICacheKeyExist("RepoDB");

    // *) indicate loading state
    apiCallStatus = ApiCallStatus.loading;
    update();
    // *) perform api call
    await BaseClient.get(
      API.baseUrl, // url
      queryParameters: {
        "q": "Flutter",
        "sort": MySharedPref.getSort(),
        "order": "desc",
        "per_page": _limit,
        "page": _page
      },

      onSuccess: (response) {
        if (kDebugMode) {
          print("URL_SORT: HIT");
        }
        var targetedData = response.data["items"];
        APICacheDBModel cacheDBModel =
            APICacheDBModel(key: "RepoDB", syncData: jsonEncode(targetedData));
        APICacheManager().addCacheData(cacheDBModel);

        repoList.addAll(
            (targetedData as List).map((e) => Items.fromJson(e)).toList());
        _page++;
        if (repoList.length < _limit) {
          hasMore = false;
        }
        // -) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automatically handle error and show message
      onError: (error) async {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
        if (!isCacheExist) {
          // show error message to user
          BaseClient.handleApiError(error);
          // -) indicate error status
          apiCallStatus = ApiCallStatus.error;
          update();
        } else {
          // *) indicate loading state
          apiCallStatus = ApiCallStatus.loading;
          update();
          var cacheData = await APICacheManager().getCacheData("RepoDB");
          if (kDebugMode) {
            print("CACHE_SORT: HIT");
          }
          var localData = jsonDecode(cacheData.syncData);

          repoList.addAll(
              (localData as List).map((e) => Items.fromJson(e)).toList());
          hasMore = false;
          apiCallStatus = ApiCallStatus.success;
          update();
        }
      }, // error while performing request
    );
  }

  void addValue() {
    _page = 0;
    hasMore = true;
    repoList.clear();
    getData();
  }

  @override
  void onInit() {
    getData();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        scrollGet();
      }
    });
    sortAfter();
    timer =
        Timer.periodic(const Duration(minutes: 30), (Timer t) => addValue());
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    timer.cancel();
    super.dispose();
  }
}
