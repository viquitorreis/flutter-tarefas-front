import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/controller/data_controller.dart';
import 'package:front/screens/all_tasks.dart';
import 'package:front/widgets/button_widget.dart';
import 'package:front/widgets/error_warning_dialog.dart';
import 'package:front/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailtController = TextEditingController();

    bool _dataValidation() {
      if (nameController.text.trim() == "") {
        Message.taskErrorOrWarning(
            "Campo vazio", "Campo nome da tarefa está vazio");
        return false;
      } else if (detailtController.text.trim() == "") {
        Message.taskErrorOrWarning(
            "Campo vazio", "Campo detalhes da tarefa está vazio");
        return false;
      }

      return true;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: double.maxFinite,
          // height: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/addtask.jpg"),
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Column(
                children: [
                  TextFieldWidget(
                    textController: nameController,
                    hintText: "Nome da tarefa",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    textController: detailtController,
                    hintText: "Detalhes da tarefa",
                    borderRadius: 15,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_dataValidation()) {
                        Get.find<DataController>().postData(
                          nameController.text.trim(),
                          detailtController.text.trim(),
                        );

                        Get.to(
                          () => AllTasks(),
                          transition: Transition.circularReveal,
                        );
                      }
                    },
                    child: ButtonWidget(
                      backgroundcolor: AppColors.mainColor,
                      text: "Adicionar",
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
