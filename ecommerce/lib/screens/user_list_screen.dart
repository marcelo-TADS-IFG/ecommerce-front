import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart'; // Importa o controlador de usuários
import '../widgets/user_card.dart'; // Importa o widget UserCard
import 'add_user_popup.dart'; // Importa a tela de pop-up para adicionar novos usuários

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<UserController>(
          builder: (context, controller, child) {
            if (controller.users.isEmpty) {
              return const Center(
                  child: Text("Nenhum usuário cadastrado"));
            }
            return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                return UserCard(user: controller.users[index]);
              },
            );
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddUserPopup(); // Widget responsável por adicionar novos usuários
                },
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.orange, // Define a cor de fundo do botão como laranja
          ),
        ),
      ],
    );
  }
}
