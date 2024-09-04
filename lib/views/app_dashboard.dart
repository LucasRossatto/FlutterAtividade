import 'package:atividade_flutter_app/models/user_model.dart';
import 'package:atividade_flutter_app/views/show_users.dart';
import 'package:flutter/material.dart';

class AppDashboard extends StatelessWidget {
  AppDashboard({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [];

    void saveUser() {
      users.add(UserModel(
        name: nameController.text,
        email: emailController.text,
        telefone: telefoneController.text,
        endereco: enderecoController.text,
      ));
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
                "Cadastro"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Nome"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: telefoneController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "telefone"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: enderecoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "endereço"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Gênero"),
              Column(
                children: [],
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                saveUser();
              },
              child: Text("Salvar")),
          ElevatedButton(
              onPressed: () {
                if (users.isNotEmpty) {
                  //Navegar
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShowUsers(
                        users: users,
                      ),
                    ),
                  );
                } else {
                  const snackBar = SnackBar(
                    content: Text('Precisa cadastrar pelo menos 1 usuário!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text("Ver"))
        ],
      ),
    );
  }
  
  void setState(Null Function() param0) {}
}
