import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/role_controller.dart';
import '../models/role.dart';

class RolePopup extends StatefulWidget {
  @override
  _RolePopupState createState() => _RolePopupState();
}

class _RolePopupState extends State<RolePopup> {
  final _formKey = GlobalKey<FormState>();
  String _roleName = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Papel'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome do Papel'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome do papel';
                }
                return null;
              },
              onSaved: (value) {
                _roleName = value!;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Adicionar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newRole = Role(
                id: 0, // O ID seria gerado pelo backend ou serviço
                name: _roleName,
              );
              // Chama o método do controlador para adicionar o papel
              Provider.of<RoleController>(context, listen: false)
                  .addRole(newRole);
              Navigator.of(context).pop(); // Fecha o popup
            }
          },
        ),
      ],
    );
  }
}
