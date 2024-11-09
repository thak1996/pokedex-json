import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_styles.dart';

class EmptyStateText extends StatelessWidget {
  const EmptyStateText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/pikachu_triste.png'),
          SizedBox(height: 16.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyles.bodyStyles[Body.body1]?.apply(
              color: AppStyles.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
