import 'package:flutter/cupertino.dart';
import 'package:nlw5_trilha_flutter/core/app_gradients.dart';
import 'package:nlw5_trilha_flutter/core/app_text_styles.dart';
import 'package:nlw5_trilha_flutter/pages/home/widgets/score_card/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: AppGradients.linear
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: "Bruno DEV",
                        style: AppTextStyles.titleBold
                      )
                    ]
                  )
                ),

                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage("https://avatars.githubusercontent.com/u/53659739?s=400&u=58ce2070db0bbd4fb5c9ca9debc905373cc9745a&v=4"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ScoreCardWidget()
          ),
        ],
      ),
    )
  );

}