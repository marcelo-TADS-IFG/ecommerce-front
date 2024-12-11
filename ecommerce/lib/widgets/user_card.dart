import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';

// Widget que exibe os detalhes de um usuário em um cartão (Card)
class UserCard extends StatelessWidget {
  final User user; // Usuário a ser exibido

  // Construtor que recebe um usuário e usa o id como chave única
  UserCard({required this.user}) : super(key: ValueKey(user.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card que envolve o ListTile, criando um visual com bordas elevadas
      child: ListTile(
        title: Text(user.userName), // Título exibindo o nome do usuário
        subtitle: Text(
          'Papel: ${user.role.name}', // Nome do papel associado
          style: TextStyle(color: Colors.grey[600]), // Cor cinza para o texto
        ),
        // Botão de deletar usuário no canto direito do cartão
        trailing: IconButton(
          icon: Icon(Icons.delete), // Ícone de lixeira
          onPressed: () {
            // Ao pressionar, chama o método de remoção do UserController
            Provider.of<UserController>(context, listen: false)
                .removeUser(user.id);
          },
        ),
      ),
    );
  }
}