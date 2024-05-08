import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/app_export.dart';
import '../../../../domain/offers_tickets.dart';
import '../../provider/air_main_provider.dart';

class DirectFlightsWidget extends StatelessWidget {
  final TicketsOffers model;
  final int index;

  const DirectFlightsWidget(this.model, this.index, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AirScreensProvider>();

    String? price = model.price!.value.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match match) => 'от ${match[1]} ',
            ) +
        ' ₽';
    String time = model.timeRange?.join(' ') ?? '';

    return Container(
      // padding: EdgeInsets.only(
      //   top: 7.v,
      //   bottom: 6.v,
      // ),
      decoration: // AppDecoration.fillBlue,
          AppDecoration.outlineGray800,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(bottom: 14.v),
            decoration: BoxDecoration(
              color: provider
                  .selectCountryModelObj.directFlightsList[index].circleColor,
              borderRadius: BorderRadius.circular(
                12.h,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.h,
                bottom: 10.v,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text(
                                model.title ?? "msg7".tr,

                                // ,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Text(
                              price,
                              style: CustomTextStyles.titleSmallBlue800,
                            )
                          ],
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                time,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 16.v,
                    width: 14.h,
                    margin: EdgeInsets.only(bottom: 21.v),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
