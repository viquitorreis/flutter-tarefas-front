import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/welcome.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Olá,",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nComece seu dia com pé direito!",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            ButtonWidget(
              backgroundcolor: AppColors.mainColor,
              text: "Adicionar tarefa",
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              backgroundcolor: Colors.white,
              text: "Ver todas",
              textColor: AppColors.smallTextColor,
            )
          ],
        ),
      ),
    );
  }
}
