import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urvandeniss_s_1/core/app_export.dart';

import '../../../../widgets/custom_text_form_field.dart';
import '../../provider/air_main_provider.dart';

class ArrivalFieldWidget extends StatelessWidget {
  const ArrivalFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          //left: 8.h,
          bottom: 2.v,
        ),
        child: Selector<AirScreensProvider, TextEditingController?>(
          selector: (context, provider) => provider.arrivalController,
          builder: (context, arrivalController, child) {
            // final provider = context.read<K1Provider>();
            return CustomTextFormField(
              controller: arrivalController,
              hintText: "lbl7".tr,
              hintStyle: CustomTextStyles.titleMediumPrimaryContainer1,
              inputLanguageCode: 'ru',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]')),
              ],
              textInputAction: TextInputAction.done,
              contentPadding: EdgeInsets.symmetric(horizontal: 1.h),
              borderDecoration: InputBorder.none,
              onSubmitted: (p0) => {
                //print('p0!!!!!!!!!!!!! $p0'),

                if (arrivalController!.text.isNotEmpty)
                  {
                     provider
                    .setArrivalCity(p0),
                    Navigator.of(context).pop(),
                    provider.showSelectCountry(),
                  }
              },
            );
          },
        ),
      ),
    );
  }
}
