import 'package:mypetmeds2/models/user.dart';
import 'package:mypetmeds2/models/medication.dart';

var USERS_TESTE = {
  '1': const User(
    meds: {
      '1' : Medication(
        id: '1', 
        name: 'med1', 
        dosage: '25mg', 
        frequency: '1 every 12 hours', 
        startDate: 'april 15th 2023', 
        endDate: 'may 1st 2023'),
      '2' : Medication(
        id: '2', 
        name: 'med2', 
        dosage: '25mg', 
        frequency: '1 every 12 hours', 
        startDate: 'april 15th 2023', 
        endDate: 'may 1st 2023'),
    },
    id: '1',
    name: 'Tonho da Lua',
    age: '11',
    avatarUrl: 'https://cdn.pixabay.com/photo/2016/11/01/21/11/avatar-1789663_960_720.png',
  ),
  '2': const User(
    meds: {
      '3' : Medication(
        id: '3', 
        name: 'med3', 
        dosage: '25mg', 
        frequency: '1 every 12 hours', 
        startDate: 'april 15th 2023', 
        endDate: 'may 1st 2023'),
      '4' : Medication(
        id: '4', 
        name: 'med4', 
        dosage: '25mg', 
        frequency: '1 every 12 hours', 
        startDate: 'april 15th 2023', 
        endDate: 'may 1st 2023'),
    },
    id: '2',
    name: 'Jamanta',
    age: '2',
    avatarUrl: 'https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png',
  ),
  '3': const User(
    meds: {
      '5' : Medication(
        id: '5', 
        name: 'med5', 
        dosage: '25mg', 
        frequency: '1 every 12 hours', 
        startDate: 'april 15th 2023', 
        endDate: 'may 1st 2023'),
      '6' : Medication(
        id: '6', 
        name: 'med6', 
        dosage: '25mg', 
        frequency: '1 every 12 hours', 
        startDate: 'april 15th 2023', 
        endDate: 'may 1st 2023'),
    },
    id: '3',
    name: 'Paola Bracho',
    age: '4',
    avatarUrl: 'https://cdn.pixabay.com/photo/2017/03/01/22/18/avatar-2109804_960_720.png',
  ),
};

