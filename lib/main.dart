import 'package:flutter/material.dart';
import 'package:mypetmeds2/provider/users.dart';
import 'package:mypetmeds2/provider/medications.dart';
import 'package:mypetmeds2/routes/app_routes.dart';
import 'package:mypetmeds2/views/medication_form.dart';
import 'package:mypetmeds2/views/medications_list.dart';
import 'package:mypetmeds2/views/user_form.dart';
import 'package:mypetmeds2/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'MyetMeds',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserList(),
        routes: {
          AppRoutes.USER_FORM: (_) => UserForm(),
          AppRoutes.MED_FORM: (_) => MedicationsForm(),
          AppRoutes.MED_LIST: (_) => MedicationsList(),
        },
      ),
    );
  }
}
