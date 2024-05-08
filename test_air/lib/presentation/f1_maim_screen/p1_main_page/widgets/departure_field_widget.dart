import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urvandeniss_s_1/core/app_export.dart';

import '../../../../widgets/custom_text_form_field.dart';
import '../../provider/air_main_provider.dart';

class DepartureFieldWidget extends StatelessWidget {
  const DepartureFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          //left: 8.h,
          bottom: 2.v,
        ),
        child: Selector<AirScreensProvider, TextEditingController?>(
          selector: (context, provider) => provider.departureController,
          builder: (context, departureController, child) {
            final provider = context.read<AirScreensProvider>();
            return CustomTextFormField(
              controller: departureController,
              hintText: provider.departureCity ?? "lbl6".tr,
              hintStyle: provider.departureCity == "lbl6".tr
                  ? CustomTextStyles.titleMediumPrimaryContainer
                  : null,
              inputLanguageCode: 'ru',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'[а-яА-Я]')), // Регулярное выражение для кириллических символов
              ],
              textInputAction: TextInputAction.done,
              contentPadding: EdgeInsets.symmetric(horizontal: 1.h),
              borderDecoration: InputBorder.none,
              onSubmitted: (p0) => {
                print('p0!!!!!!!!!!!!! $p0'),
                provider.savedepartureCity(),
              },
            );
          },
        ),
      ),
    );
  }
}
