import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controllers/all_locations_view_controller.dart';
import '../../theme/type_face.dart';

class ResultsList extends StatelessWidget {
  final List<dynamic> data;
  final Function(String) onToggle;
  final bool isSelected;
  ResultsList(
      {super.key,
      required this.data,
      required this.onToggle,
      required this.isSelected});

  AllLocationsViewsController locCtrl = Get.find<AllLocationsViewsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: data.length - 1,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  data[index + 1][0],
                  style: b1.copyWith(color: Colors.pink),
                ),
                trailing: locCtrl.selectedLocations.contains(data[index + 1][0])
                    ? const Icon(
                        Icons.done,
                        color: Colors.pink,
                      )
                    : const SizedBox(),
                onTap: () => onToggle(data[index + 1][0]),
              );
            }),
      ),
    );
  }
}
