import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/theme/app_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 40.h),
                child: AppIcon.pokeball(color: AppStyles.white),
              ),
              SizedBox(width: 12.w),
              Text(
                'Pokedex',
                style: AppStyles.headerStyles[Header.headline]?.apply(
                  color: AppStyles.white,
                ),
              ),
            ],
          ),
          Builder(
            builder: (context) => IconButton(
              icon: AppIcon.menu(),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}
