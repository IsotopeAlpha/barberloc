import 'package:barberloc/models/user.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'endpoints.dart';

class MyApiRequests {
  static Future<User> logUser(String email, String password) async {
    Map data = {"email": email, "password": password};
    try {
      final value1 = await Dio().post(Endpoints.loginUrl, data: data);
      return User.fromJson(value1.data);
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }


  static Future updateUser(Map data, String id) async {
    try {
      final value1 = await Dio().put("${Endpoints.usersUrl}/$id", data: data);
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future encryptPass(Map data) async {
    try {
      final value1 =
          await Dio().post("${Endpoints.usersUrl}/encrypt", data: data);
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future sendVerification(Map data) async {
    try {
      final value1 = await Dio().post(Endpoints.verifiyEmailUrl, data: data);
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future verifyEmail(String email, String token) async {
    try {
      final value1 =
          await Dio().get("${Endpoints.verifiyEmailUrl}/$email/$token");
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future getUser(Map data) async {
    try {
      final value1 = await Dio().post("${Endpoints.usersUrl}/find", data: data);
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future getUserById(String id) async {
    try {
      final value1 = await Dio().get("${Endpoints.usersUrl}/find/$id");
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future<List> getHostels() async {
    try {
      final value1 = await Dio().get(Endpoints.hostelsUrl);

      List hostel = [];
      if (value1.statusCode == 200) {
        hostel = value1.data;
        await Hive.box('savedDetails').put('hostels', value1.data);
        return hostel;
      } else {
        return Future.error("Error");
      }
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }
static Future<List> getOfflineHostels() async {
    try {
      final value1 = await Dio().get(Endpoints.offlineHostelsUrl);

      List hostel = [];
      if (value1.statusCode == 200) {
        hostel = value1.data;
        await Hive.box('savedDetails').put('offlinehostels', value1.data);
        return hostel;
      } else {
        return Future.error("Error");
      }
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future<List> getRooms() async {
    try {
      final value1 = await Dio().get(Endpoints.roomsUrl);

      if (value1.statusCode == 200) {
        return value1.data;
      } else {
        return Future.error("Error");
      }
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future<List> getAds() async {
    try {
      final value1 = await Dio().get(Endpoints.adsUrl);

      if (value1.statusCode == 200) {
        return value1.data;
      } else {
        return Future.error("Error");
      }
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future<List> performSearch(String searchBy, String searchParam) async {
    Map data = {searchBy: searchParam};
    try {
      final value1 =
          await Dio().post("${Endpoints.hostelsUrl}/$searchBy", data: data);

      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future doBooking(Map data) async {
    try {
      final value1 = await Dio().post(Endpoints.acceptedBookingUrl, data: data);

      if (Hive.box('savedDetails').get('bookings') == null) {
        List bookings = [];
        bookings.add(value1.data['data']);
        await Hive.box('savedDetails').put('bookings', bookings);
      } else {
        List bookings = Hive.box('savedDetails').get('bookings');
        bookings.add(value1.data['data']);
        await Hive.box('savedDetails').put('bookings', bookings);
      }

      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future doSchedule(Map data) async {
    try {
      final value1 = await Dio().post(Endpoints.scheduleUrl, data: data);
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future updateBooking(Map data, String id) async {
    try {
      final value1 =
          await Dio().put("${Endpoints.acceptedBookingUrl}/$id", data: data);
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future<List> getPayments() async {
    Map user = await Hive.box('savedDetails').get('user');
    try {
      final value1 = await Dio()
          .post(Endpoints.paymentUrl, data: {"email": user['email']});
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

  static Future<List> getMTokens() async {
    Map user = await Hive.box('savedDetails').get('user');
    try {
      final value1 = await Dio().post('${Endpoints.messageTokensUrl}/email',
          data: {"email": user['email']});
      return value1.data;
    } on DioException catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    } catch (err) {
      return Future.error(
          {"status": "error", "msg": "Something went wrong", "data": err});
    }
  }

}
