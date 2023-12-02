import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = [
      "Lista 1",
      "Lista 2",
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppColors.textGrey,
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 40,
            ),
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.arrow_back,
              color: AppColors.mainColor,
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/header.jpg"),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.edit_document,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  "2",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryColor,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightDeleteIcon,
                  onDismissed: (DismissDirection direction) {
                    print("Recusando");
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      // equerda para direita
                      return false;
                    } else {
                      return Future.delayed(Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 15,
                    ),
                    child: TaskWidget(
                      text: myData[index],
                      color: AppColors.mainColor,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
