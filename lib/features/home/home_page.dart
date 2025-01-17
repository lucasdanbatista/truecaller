import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:truecaller/features/home/home_view_model.dart';
import 'package:truecaller/utils/app_router.gr.dart';
import 'package:truecaller/utils/dependency_injection.dart';

import '../../entities/phone_list_mode.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = get<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrueCaller'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Observer(
            builder: (context) => SwitchListTile(
              title: Text('Bloquear números fora da lista de contatos'),
              value: viewModel.isRejectUnknownCallersEnabled,
              onChanged: viewModel.setRejectUnknownCallersEnabled,
            ),
          ),
          ListTile(
            title: Text('Números bloqueados'),
            leading: Icon(Icons.block),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => context.pushRoute(
              PhoneListRoute(mode: PhoneListMode.blacklist),
            ),
          ),
        ],
      ),
    );
  }
}
