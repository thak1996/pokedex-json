import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_styles.dart';

class ErrorStateText extends StatelessWidget {
  const ErrorStateText({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.headerStyles[Header.subTitle1],
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyles.primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
