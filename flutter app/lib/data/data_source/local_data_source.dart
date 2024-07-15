// import 'package:emad_app/data/network/error_handler.dart';

import 'package:emad_app/data/data_source/db/sqlite.dart';

import '../response/responses.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millis
const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 30s in millis

abstract class LocalDataSource {
  Future<HomeResponse> getHomeData();

  // Future<void> saveHomeToCache(HomeResponse homeResponse);

  void clearCache();

  // void removeFromCache(String key);

  // Future<StoreDetailsResponse> getStoreDetails();

  // Future<void> saveStoreDetailsToCache(StoreDetailsResponse response);
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];

    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      return cachedItem.data;
    } else {

      // final db = await  Db.db();
      //
      // final data = await db.query('products');
      // return
      throw UnimplementedError('');
    }
  }

  // @override
  // Future<void> saveHomeToCache(HomeResponse homeResponse) async {
  //   cacheMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  // }

  // @override
  // Future<StoreDetailsResponse> getStoreDetails() async {
  //   CachedItem? cachedItem = cacheMap[CACHE_STORE_DETAILS_KEY];

  //   if (cachedItem != null &&
  //       cachedItem.isValid(CACHE_STORE_DETAILS_INTERVAL)) {
  //     return cachedItem.data;
  //   } else {
  //     // throw ErrorHandler.handle(DataSource.CACHE_ERROR);
  //     throw UnimplementedError('');
  //   }
  // }

  // @override
  // Future<void> saveStoreDetailsToCache(StoreDetailsResponse response) async {
  //   cacheMap[CACHE_STORE_DETAILS_KEY] = CachedItem(response);
  // }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  // @override
  // void removeFromCache(String key) {
  //   cacheMap.remove(key);
  // }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    // expirationTimeInMillis -> 60 sec
    // currentTimeInMillis -> 1:00:00
    // cacheTime -> 12:59:30
    // valid -> till 1:00:30
    return isValid;
  }
}
