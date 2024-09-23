import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:bornomala/app/data/bengali_alphabets/bengali_vowels.dart';
import 'package:bornomala/app/data/clrs.dart';
import 'package:bornomala/app/data/imgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/alphabet_controller.dart';

class AlphabetView extends GetView<AlphabetController> {
  const AlphabetView({super.key});
  @override
  Widget build(BuildContext context) {
    // print('অ'.codeUnitAt(0));
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('AlphabetView'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: Clrs.ylwToBlu,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // alphabet list
                SizedBox(
                  height: 210.w,
                  child: ListView.builder(
                    itemCount: BengaliVowels.vowels.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 10.h, left: 20.w),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          height: controller.selectedLetter == 65 + index
                              ? 200.h
                              : 130.h,
                          width: 150.w,
                          margin: EdgeInsets.only(right: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: Clrs.ylwToBlu,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              BengaliVowels.vowels[index],
                              style: GoogleFonts.notoSans(
                                fontSize:
                                    controller.selectedLetter == 65 + index
                                        ? 100.sp
                                        : 80.sp,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Main Letter (Big One)
                Container(
                  height: 820.h,
                  width: double.infinity,
                  child: Center(
                    child: BorderedText(
                      strokeWidth: 50.w,
                      strokeColor: Colors.white,
                      child: Text(
                        'অ',
                        style: TextStyle(
                          height: 0.9,
                          fontSize: 880.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                // word list
                Padding(
                  padding: EdgeInsets.only(right: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // letter for text
                      Text(
                        '- তে',
                        style: TextStyle(
                          fontSize: 80.sp,
                          color: Colors.blue,
                        ),
                      ),
                      // word 1
                      Text(
                        'অসি',
                        style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                        ),
                      ),
                      // word 2

                      Text(
                        'অজু',
                        style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                        ),
                      ),
                      // word 3

                      Text(
                        'অমর',
                        style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                        ),
                      ),
                      // word 4
                      Text(
                        'অজগর',
                        style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // image & words
          Padding(
            padding: EdgeInsets.only(
              bottom: 200.h,
              right: 20.w,
              // left: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //  image
                Image.asset(
                  Imgs.banglaA,
                  width: 980.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: Get.width,
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Center(
          child: AutoSizeText(
            'অজগরটি আসছে তেঁরে',
            style: GoogleFonts.notoSans(
              fontSize: 80,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
