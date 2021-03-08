import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simpleLauncher/ui/views/set_up/set_up_view_model.dart';
import 'package:simpleLauncher/ui/widgets/dumb/app_drawer.dart';
import 'package:simpleLauncher/ui/widgets/dumb/page_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:simpleLauncher/styles/dark_styles.dart' as styles;

class SetUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetUpViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: new NeverScrollableScrollPhysics(),
                  onPageChanged: (int page) => model.onPageChanged(page),
                  controller: model.pageController,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Set Up",
                          style: styles.apps,
                        ),
                        FutureBuilder(
                          future: model.getApplications(),
                          builder: (context, snapshot) {
                            return Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.apps?.length,
                                itemBuilder: (context, index) {
                                  return TextButton(
                                    onPressed: () => model.onAppSelected(index),
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            model.apps[index].data.appName,
                                            style: styles.apps,
                                          ),
                                          model.apps[index].selected
                                              ? Icon(
                                                  Icons.check_circle,
                                                  color: Colors.white,
                                                )
                                              : Icon(
                                                  Icons.circle,
                                                  color: Colors.white10,
                                                )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Set Up",
                          style: styles.apps,
                        ),
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () => model.requestPermissions(),
                              child: Text("Request Permissions"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white24),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              PageIndicator(
                currentPage: model.currentPage,
                numberOfPages: 2,
              ),
            ],
          ),
        ),
        floatingActionButton: model.generateFloatingButton(),
      ),
      viewModelBuilder: () => SetUpViewModel(),
    );
  }
}
