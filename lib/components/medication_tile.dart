import 'package:flutter/material.dart';
import 'package:mypetmeds2/models/medication.dart';
import 'package:mypetmeds2/provider/medications.dart';
import 'package:mypetmeds2/routes/app_routes.dart';
import 'package:provider/provider.dart';

class MedicationTile extends StatelessWidget {
  final Medication medication;
  const MedicationTile(this.medication);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(medication.name),
      subtitle: Container( 
        child: Column(
          children: <Widget>[
            Text(medication.dosage),
            Text(medication.frequency),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.MED_FORM,
                  arguments: medication,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                Provider.of<Medications>(context, listen: false).remove(medication);
              },
            ),
          ],
        )
      ),
    );
  }
}
