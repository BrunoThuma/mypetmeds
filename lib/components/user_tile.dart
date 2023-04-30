import 'package:flutter/material.dart';
import 'package:mypetmeds2/models/user.dart';
import 'package:mypetmeds2/provider/medications.dart';
import 'package:mypetmeds2/views/medications_list.dart';
import 'package:mypetmeds2/provider/users.dart';
import 'package:mypetmeds2/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:mypetmeds2/data/users_teste.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
     final avatar = user.avatarUrl==null || user.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person))
         : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                Provider.of<Users>(context, listen: false).remove(user);
              },
            ),
          ],
        )
      ),
      onTap: () {
        // Não sei o que to fazendo aqui, mas sei que funciona
        // Minha intenção é criar um context pro Widget de MedicationsList
        // cujo provider seja um Medications
        // Acho que consegui, mas n entendo a sintaxe disso
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => Medications(this.user),
              child: MedicationsList(),
            )
          )
        );
        // print("id do user selecionado ${this.user.id}");
        // print("key existe no dicionario? ${USERS_TESTE.containsKey(this.user.id)}");
      },
    );
  }
}
