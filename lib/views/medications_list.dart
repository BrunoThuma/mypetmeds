import 'package:flutter/material.dart';
import 'package:mypetmeds2/components/medication_tile.dart';
import 'package:mypetmeds2/provider/medications.dart';
import 'package:mypetmeds2/routes/app_routes.dart';
import 'package:mypetmeds2/views/medication_form.dart';
import 'package:provider/provider.dart';

class  MedicationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Medications medications=Provider.of<Medications>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Medicamentos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.MED_FORM
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: medications.count,
        itemBuilder: (ctx, i) => MedicationTile(medications.byIndex(i)),
      ),
    );
  }
}


