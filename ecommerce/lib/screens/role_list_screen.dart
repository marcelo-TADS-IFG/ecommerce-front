import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/role_controller.dart'; // Importa o controlador de papéis
import '../widgets/role_card.dart'; // Importa o widget RoleCard
import 'add_role_popup.dart'; // Importa a tela de pop-up para adicionar novos papéis

class RoleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<RoleController>(
          builder: (context, controller, child) {
            if (controller.roles.isEmpty) {
              return const Center(
                  child: Text("Nenhum papel cadastrado"));
            }
            return ListView.builder(
              itemCount: controller.roles.length,
              itemBuilder: (context, index) {
                return RoleCard(role: controller.roles[index]);
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
                  return RolePopup(); // Widget responsável por adicionar novos papéis
                },
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue, // Define a cor de fundo do botão como azul
          ),
        ),
      ],
    );
  }
}
