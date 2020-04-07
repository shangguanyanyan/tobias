import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

final MethodChannel _channel = const MethodChannel('com.jarvanmo/tobias');

/// [evn] only supports Android due to native AliPaySDK
Future<Map> aliPay(String order, {AliPayEvn evn = AliPayEvn.ONLINE}) async {
  if(Platform.isIOS){
    return Future.value({});
  }
  return await _channel
      .invokeMethod("pay", {"order": order, "payEnv": evn.index});
}

Future<Map> aliPayAuth(String auth) async {
  if(Platform.isIOS){
    return Future.value({});
  }
  return await _channel.invokeMethod("auth", auth);
}

Future<String> aliPayVersion() async {
  if(Platform.isIOS){
    return Future.value("");
  }
  return await _channel.invokeMethod("version");
}

Future<bool> isAliPayInstalled() async {
  if(Platform.isIOS){
    return Future.value(true);
  }
  return await _channel.invokeMethod("isAliPayInstalled");
}

enum AliPayEvn { ONLINE, SANDBOX }
