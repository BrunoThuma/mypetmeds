import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mypetmeds2/models/medication.dart';
import 'package:mypetmeds2/provider/medications.dart';
import 'package:provider/provider.dart';

class MedicationsForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Medication? medication) {
    if (medication != null) {
      _formData['id'] = medication.id;
      _formData['name'] = medication.name;
      _formData['dosage'] = medication.dosage;
      _formData['frequency'] = medication.frequency;
      _formData['startDate'] = medication.startDate;
      _formData['endDate'] = medication.endDate;
    } else {
      print("Medication is null, showing empty form");
    };
  }

  @override
  Widget build(BuildContext context) {
    final testMed = Provider.of<Medications?>(context);
    if (testMed == null) {
      print("Provider n é de Medications (╯°□°)╯︵ ┻━┻");
    } else {
      print("Provider é do tipo Medications");
    }
    final Medication? medication = ModalRoute.of(context)?.settings.arguments as Medication?;
    _loadFormData(medication);

    return Scaffold(
        appBar: AppBar(
          title: Text('Medication\'s Data'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Medications>(context, listen: false).put(
                    Medication(
                      id: _formData['id'] ?? Random(420).toString(),
                      name: _formData['name']!,
                      dosage: _formData['dosage']!,
                      frequency: _formData['frequency']!,
                      startDate: _formData['startDate']!,
                      endDate: _formData['endDate']!,
                    ),
                  );
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
                    initialValue: _formData['dosage'],
                    decoration: InputDecoration(labelText: 'Dosage'),
                    onSaved: (value) => _formData['dosage'] = value ?? "",
                  ),
                  TextFormField(
                    initialValue: _formData['frequency'],
                    decoration: InputDecoration(labelText: 'Frequency'),
                    onSaved: (value) => _formData['frequency'] = value ?? "",
                  ),
                  TextFormField(
                    initialValue: _formData['startDate'],
                    decoration: InputDecoration(labelText: 'Start Date'),
                    onSaved: (value) => _formData['startDate'] = value ?? "",
                  ),
                  TextFormField(
                    initialValue: _formData['endDate'],
                    decoration: InputDecoration(labelText: 'End Date'),
                    onSaved: (value) => _formData['endDate'] = value ?? "",
                  ),
                ],
              ),
            )));
  }
}
