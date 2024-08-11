import 'package:flutter/material.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:islamy_app/Core/Utlis/AppAssets.dart';
import 'package:islamy_app/Core/Utlis/AppColors.dart';
import 'package:islamy_app/Moduls/Sebha_tap/Wdiget/CustomSebhaButton.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTapView extends StatefulWidget {
  const SebhaTapView({super.key});

  @override
  State<SebhaTapView> createState() => _SebhaTapViewState();
}
class _SebhaTapViewState extends State<SebhaTapView>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 500),
    );
    setRotate(50);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void setRotate(int degree) {
    final angle = (degree * 3.14) / 360;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }
  int currentNumber = 0;
  String prarer = "سبحان الله";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var _localizations = AppLocalizations.of(context)!;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: height * .03,
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: height * .035,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Transform.rotate(
                    angle: animation.value,
                    child: Image.asset(
                      ImageAssets.sebha_image,
                      color: provider.isDarkMode()
                          ? AppColors.yellowColor
                          : AppColors.primaryLightColor,
                    ),
                  ),
                )),
            Image.asset(
              ImageAssets.head_of_sebha,
              color: provider.isDarkMode()
                  ? AppColors.yellowColor
                  : AppColors.primaryLightColor,
            )
          ],
        ),
        SizedBox(
          height: height * .27,
        ),
        Text(
          _localizations.tasbeh,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        Container(
          height: height * .08,
          margin: EdgeInsets.symmetric(
              horizontal: width * .42, vertical: height * .03),
          decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? AppColors.primaryDarkColor
                  : AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              "$currentNumber",
              style: theme.textTheme.displayMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        CustomSebhaButton(
            onPressed: () {
              controller.forward(from: 0);
              onTapped();
              setState(() {});
            },
            prarer: prarer)
      ],
    );
  }
  void onTapped() {
    if (currentNumber < 100) {
      currentNumber++;
    } else {
      currentNumber = 1;
      prarer = "سبحان الله";
    }
    if (currentNumber >= 0 && currentNumber <= 33) {
      prarer = "سبحان الله";
    } else if (currentNumber >= 34 && currentNumber <= 66) {
      prarer = "الحمدلله";
    } else if (currentNumber >= 67 && currentNumber <= 99) {
      prarer = "الله أكبر";
    } else if (currentNumber == 100) {
      prarer = "لا إله إلا الله";
    }
  }
}
