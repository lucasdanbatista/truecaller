import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:truecaller/features/phone_list/phone_list_view_model.dart';
import 'package:truecaller/utils/dependency_injection.dart';

import '../../entities/phone_list_mode.dart';

@RoutePage()
class PhoneListPage extends StatefulWidget {
  final PhoneListMode mode;

  const PhoneListPage({super.key, required this.mode});

  @override
  State<PhoneListPage> createState() => _PhoneListPageState();
}

class _PhoneListPageState extends State<PhoneListPage> {
  final viewModel = get<PhoneListViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetch(widget.mode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          switch (widget.mode) {
            PhoneListMode.whitelist => 'Números permitidos',
            PhoneListMode.blacklist => 'Números bloqueados',
          },
        ),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: viewModel.phones.length,
          itemBuilder: (context, index) {
            final phone = viewModel.phones[index];
            return ListTile(
              title: Text(phone),
              trailing: IconButton(
                onPressed: () => viewModel.remove(widget.mode, phone),
                icon: Icon(Icons.delete_outline),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final textController = TextEditingController();
          final phone = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Insira o número'),
                content: TextFormField(
                  controller: textController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Número',
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('CANCELAR'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: Text('SALVAR'),
                    onPressed: () => Navigator.pop(
                      context,
                      textController.text.trim(),
                    ),
                  ),
                ],
              );
            },
          );
          if (phone?.trim().isNotEmpty == true) {
            viewModel.add(widget.mode, phone!.trim());
          }
        },
      ),
    );
  }
}
