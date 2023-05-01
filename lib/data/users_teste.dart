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
    name: 'Cachorro Aifolou',
    age: '11',
    avatarUrl: 'https://preview.redd.it/pa1fzn4wmnr71.jpg?width=186&format=pjpg&auto=webp&s=bec580c31b2e4edcd75b0c4165763e14dff65085',
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
    name: 'Bart',
    age: '8',
    avatarUrl: 'https://www.petlove.com.br/images/breeds/193080/profile/original/border_collie-p.jpg?1532538415',
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
    name: 'Jhow',
    age: '2',
    avatarUrl: 'https://www.adoropets.com.br/wp-content/uploads/2018/04/personalidade-kuvasz.jpg',
  ),
};

