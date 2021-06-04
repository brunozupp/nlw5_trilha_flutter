import 'package:flutter/material.dart';
import 'package:nlw5_trilha_flutter/core/app_colors.dart';
import 'package:nlw5_trilha_flutter/core/app_images.dart';
import 'package:nlw5_trilha_flutter/core/app_text_styles.dart';
import 'package:nlw5_trilha_flutter/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border
          ),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 24),
          Text(
            "Gerenciamento de Estado", 
            style: AppTextStyles.heading15
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Text(
                "3 de 10",
                style: AppTextStyles.body11,
              ),
              SizedBox(width: 24),
              Expanded(
                child: ProgressIndicatorWidget(
                  value: .3,
                )
              )
            ],
          )
        ],
      ),
    );
  }
}