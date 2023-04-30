import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mypetmeds2/data/users_teste.dart';
import 'package:mypetmeds2/models/medication.dart';
import 'package:mypetmeds2/models/user.dart';

class Medications with ChangeNotifier {
  final User user;
  final Map<String, Medication> _itens;

  Medications(this.user) 
    : _itens = {...USERS_TESTE[user.id]!.meds};

  List<Medication> get all {
    // We can force cast this because if it is null
    // it means we were trying to open meds of a non
    // existent pet, this should be treated tho
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Medication byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Medication medication) {
    if (medication == null) {
      return;
    }

    if (medication.id != null && medication.id.trim().isNotEmpty && _itens.containsKey(medication.id)) {
      _itens.update(
          medication.id,
          (_) => Medication(
            id: medication.id, 
            name: medication.name, 
            dosage: medication.dosage, 
            frequency: medication.frequency, 
            startDate: medication.startDate, 
            endDate: medication.endDate));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          () => Medication(
            id: id, 
            name: medication.name, 
            dosage: medication.dosage, 
            frequency: medication.dosage, 
            startDate: medication.startDate, 
            endDate: medication.endDate));
    }
    notifyListeners();
  }

  void remove(Medication medication) {
    if (medication != null && medication.id != null) {
      _itens.remove(medication.id);
      notifyListeners();
    }
  }
}
