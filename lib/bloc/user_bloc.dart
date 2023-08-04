import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:push_notifications/bloc/user_even.dart';
import 'package:push_notifications/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(isLoading: true, listUser: []));

  @override
  Stream<UserState> getUser(UserEvent event) async* {
    if (event is FetchDataUser) {
      yield UserState(isLoading: true, listUser: []);
      try {
        final response =
            await http.get(Uri.parse('https://dummyjson.com/users'));
        if (response.statusCode == 200) {
          final List<dynamic> listUser = json.decode(response.body);
          List<dynamic> users = listUser.map((e) => e['user']).toList();
          yield (UserState(isLoading: false, listUser: users));
        }
      } catch (e) {
        yield UserState(isLoading: true, listUser: []);
        debugPrint("error bloc ...$e");
      }
    }
  }
}
