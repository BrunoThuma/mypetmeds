import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mypetmeds2/data/users_teste.dart';
import 'package:mypetmeds2/models/medication.dart';
import 'package:mypetmeds2/models/user.dart';
import 'package:mypetmeds2/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    } else {
      print("User is null, showing empty form");
    };
  }

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;
    _loadFormData(user);

    return Scaffold(
        appBar: AppBar(
          title: Text('Pet\'s Data'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      meds: {'9' : Medication(id: '9', name: "Teste", dosage: "25mg", frequency: "1 every 1", startDate: "aaaa", endDate: "aaaaaaa")},
                      id: _formData['id'] ?? Random(420).toString(),
                      name: _formData['name']!,
                      email: _formData['email']!,
                      avatarUrl: _formData['avatarUrl']!,
                    ),
                  );
                  print("id do user adicionado ${USERS_TESTE.values.last.id}");
                  print("key do user adicionado ${USERS_TESTE.keys.last}");
                  print("meds do user adicionado ${USERS_TESTE.values.last.meds.length}");
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _formData['name'],
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Nome inválido!';
                      if (value.trim().length < 3) return 'Nome muito pequeno';
                      return null;
                    },
                    onSaved: (value) => _formData['name'] = value ?? "",
                  ),
                  TextFormField(
                    initialValue: _formData['email'],
                    decoration: InputDecoration(labelText: 'E-mail'),
                    onSaved: (value) => _formData['email'] = value ?? "",
                  ),
                  TextFormField(
                    initialValue: _formData['avatarUrl'],
                    decoration: InputDecoration(labelText: 'URL do Avatar'),
                    onSaved: (value) => _formData['avatarUrl'] = value ?? "",
                  ),
                ],
              ),
            )));
  }
}
