import 'dart:convert';

import 'package:all_things_green/constants/enthusiasts_data.dart';
import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/plant_controller.dart';
import 'package:get/get.dart';

class PlantPage extends GetView<PlantController> {
  const PlantPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: EnthusiastData.plantData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final plant = EnthusiastData.plantData[index];
          return GestureDetector(
            // onTap: () => Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => PlantDetailsPage(link: plant['link']),
            //   ),
            // ),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                            Text(
                              plant['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Growing season:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'North: ${plant['north_growing_season'].join(', ')}\nSouth: ${plant['south_growing_season'].join(', ')}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Days to maturation: ${plant['days_to_maturation']}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Sowing depth: ${plant['sowing_depth']} inches}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(height: 10),
                            Row(children: [
                              ElevatedButton(
                              onPressed: () => {
                                controller.buyNow(plant['link'])
                              },
                              child: Text('Buy Now'),
                            ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
  onPressed: () {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((selectedTime) {
      if (selectedTime != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Selected Time for Notification"),
              content: Text("You have selected ${selectedTime.format(context)}"),
              actions: [
                ElevatedButton(
                  onPressed: () => {
                    controller.setNotification(selectedTime.hour, selectedTime.minute),
                    Navigator.pop(context)
                    },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  },
  child: Text("Add"),
),
                              )

                            ],),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
