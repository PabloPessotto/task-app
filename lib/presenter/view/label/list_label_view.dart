import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/label/list_label_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/button/arrow_close_button.dart';
import 'package:taskforme/shared/components/card/label_card.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class ListLabelView extends StatelessWidget {
  ListLabelView({super.key});

  final ListLabelViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return BlurBackground(
      blur: 100,
      circles: [
        BackgroundCircle(
          colors: [
            Colors.cyanAccent.withOpacity(.4),
            Colors.deepPurple.withOpacity(.4),
          ],
        ),
      ],
      scaffold: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ArrowCloseButton(),
                    const SizedBox(height: 20),
                    Text(
                      'Etiquetas',
                      style: TextStyle(
                        fontSize: height / 34,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: BaseView(
                  safeAreaTop: false,
                  child: Obx(() {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: _viewModel.listLabel.map((e) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: LabelCard(
                              label: e,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: width / 30).copyWith(
            bottom: MediaQuery.of(context).padding.bottom + 15,
          ),
          padding: EdgeInsets.symmetric(horizontal: width / 70),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  await pushView(Routes.registerLabel);
                  _viewModel.loadLabels();
                },
                icon: const Icon(Icons.add),
                color: Colors.white,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
