import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy_app/Core/Utlis/AppColors.dart';
class AppTheme{
  static ThemeData lightTheme=ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor
      ),
      bodyMedium:  GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor
      ),
      displayMedium:  GoogleFonts.inter(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor
      ),

    )
  );
  static ThemeData darkTheme=ThemeData(
      textTheme: TextTheme(
          titleLarge: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor
          ),
        bodyMedium:  GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor
        ),
        displayMedium:  GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor
        ),
      )
  );
}