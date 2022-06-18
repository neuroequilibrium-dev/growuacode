import 'dart:convert';

import '../../Class/user.dart';
import '../../Methods/api.dart';

Future<List<user>> getUserData(context)async{
  String endPoint = 'users';
  List resp = await getApi(context, endPoint);
  List<user> _users = resp.map((e) => user.fromJson(e)).toList();
  _users = _users + _users;
  return _users;
}