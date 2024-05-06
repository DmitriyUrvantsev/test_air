import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/app_export.dart';
import '../../p1_main_page/provider/air_main_provider.dart';
import '../models/settings_item_model.dart';

class SettingsItemWidget extends StatelessWidget {
  final SettingItemModel chipsItemModelObj;
  final int index;
  final void Function(DateTime)? onDateSelected;

  const SettingsItemWidget({
    super.key,
    required this.chipsItemModelObj,
    required this.index,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<K1Provider>(context);
    final dateFormat = DateFormat('dd MMM, E', 'ru');
    return ElevatedButton(
      onPressed: () {
        if (chipsItemModelObj.onSelectDate != null && index == 0) {
          Provider.of<K1Provider>(context, listen: false)
              .selectArrivalDateCallback((date) {
            if (onDateSelected != null) {
              onDateSelected!(date);
            }
          }, context);
        }

        if (chipsItemModelObj.onSelectDate != null && index == 1) {
          Provider.of<K1Provider>(context, listen: false)
              .selectDepartureDateCallback((date) {
            if (onDateSelected != null) {
              onDateSelected!(date);
            }
          }, context);
        }
        if (index == 3) {
          Provider.of<K1Provider>(context, listen: false).showFilters();
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
          // side: BorderSide(
          //   color: theme.colorScheme.onPrimary.withOpacity(0.6),
          //   width: 1.h,
          // ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            // if (states.contains(MaterialState.pressed)) {
            if (true) {
              return theme.colorScheme.primary.withOpacity(0.6);
            }
            // return chipsItemModelObj.isSelected ?? false
            //     ? theme.colorScheme.primary
            //     : Colors.transparent;
          },
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: index == 0 && provider.isArrivalDate
                ? null
                : chipsItemModelObj.iconButton ?? null,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(right: 8.h),
          ),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: index == 0 && provider.isArrivalDate
                      ? dateFormat
                          .format(provider.selectedArrivalDate)
                          .split(',')[0]
                      : index == 1 && provider.isDepartureDate
                          ? dateFormat
                              .format(provider.selectedDepartureDate)
                              .split(',')[0]
                          : chipsItemModelObj.iconText ??
                              dateFormat.format(DateTime.now()).split(',')[0],
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 14.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: index == 0 && provider.isArrivalDate
                      ? ','
                      : index == 1 && provider.isDepartureDate
                          ? ','
                          : index == 1 && provider.isDepartureDate == false
                              ? ','
                              : null,
                ),
                TextSpan(
                  text: index == 0 && provider.isArrivalDate
                      ? dateFormat
                          .format(provider.selectedArrivalDate)
                          .split(',')[1]
                      : index == 1 && provider.isDepartureDate
                          ? dateFormat
                              .format(provider.selectedDepartureDate)
                              .split(',')[1]
                          : index == 1 && provider.isDepartureDate == false
                              ? dateFormat.format(DateTime.now()).split(',')[1]
                              : null,
                  style: TextStyle(
                    color: appTheme.gray700,
                    fontSize: 14.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          )

          // Text(
          //   chipsItemModelObj.iconText ?? '',
          //   style: TextStyle(
          //     color: theme.colorScheme.onPrimary,
          //     fontSize: 14.fSize,
          //     fontFamily: 'SF Pro Display',
          //     fontWeight: FontWeight.w500,
          //     fontStyle: FontStyle.italic,
          //   ),
          // ),
        ],
      ),
    );
  }
}
