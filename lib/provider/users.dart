import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mypetmeds2/data/users_teste.dart';
import 'package:mypetmeds2/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _itens = {...USERS_TESTE};

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      _itens.update(
          user.id,
          (_) => User(
                meds: user.meds,
                id: user.id,
                name: user.name,
                age: user.age,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          () => User(
                meds: {},
                id: id,
                name: user.name,
                age: user.age,
                avatarUrl: user.avatarUrl,
              ));
    }
    // Mudar essa logica para atualizar apenas os dados novos
    USERS_TESTE.clear();
    USERS_TESTE.addAll(this._itens);
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _itens.remove(user.id);
      USERS_TESTE.clear();
      USERS_TESTE.addAll(this._itens);
      notifyListeners();
    }
  }
}
