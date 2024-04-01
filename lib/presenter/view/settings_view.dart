import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/settings/settings_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final SettingsViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return Scaffold(
      body: BaseView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: closeView,
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 28,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Configurações",
                style: TextStyle(
                  fontSize: height / 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              const Text('Geral'),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: const Icon(Icons.dark_mode_rounded),
                      title: const Text("Dark mode"),
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    const Divider(
                      height: .1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.edit_notifications_rounded),
                      title: Text("Notificações"),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    const Divider(
                      height: .1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.help_rounded),
                      title: Text("Ajuda"),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Termos de uso'),
              const Card(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.file_open_rounded),
                      title: Text("Política de privacidade"),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(
                      height: .1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.file_open_rounded),
                      title: Text("Termos e condições"),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: width / 15).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 15,
        ),
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: LoadingButton(
          label: "Sair do app",
          onPressed: _viewModel.logout,
        ),
      ),
    );
  }
}
