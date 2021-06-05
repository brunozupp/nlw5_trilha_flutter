import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/core/app_images.dart';
import 'package:nlw5_trilha_flutter/core/app_text_styles.dart';
import 'package:nlw5_trilha_flutter/pages/challenge/widgets/next_button/next_button_widget.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {

  final String title;
  final int length;
  final int result;

  const ResultPage({ 
    Key? key, 
    required this.title, 
    required this.length, 
    required this.result 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(AppImages.trophy),
            
            Column(
              children: [
                Text(
                  "Parabéns",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(width: 16),
                Text(
                  "Você concluiu",
                  style: AppTextStyles.body,
                ),
                Text(
                  title,
                  style: AppTextStyles.bodyBold,
                ),
                Text(
                  "Com $result de $length acertos",
                  style: AppTextStyles.body,
                ),
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: NextButtonWidget.purple(
                      label: "Compartilhar", 
                      onTap: () {
                        Share.share("DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive: ${result / length} de aproveitamento");
                      }
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: NextButtonWidget.white(
                      label: "Voltar ao início", 
                      onTap: () {
                        Navigator.pop(context);
                      }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}