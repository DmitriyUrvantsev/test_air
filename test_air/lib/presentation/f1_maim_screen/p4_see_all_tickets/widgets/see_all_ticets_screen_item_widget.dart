import 'package:flutter/material.dart';
import 'package:urvandeniss_s_1/core/utils/time.dart';
import '../../../../core/app_export.dart';
import '../../../../domain/all_tickets.dart';
// ignore_for_file: must_be_immutable

class SeeAllTicetsItemWidget extends StatelessWidget {
  SeeAllTicetsItemWidget(this.model, {Key? key})
      : super(
          key: key,
        );

  Tickets model;

  @override
  Widget build(BuildContext context) {
    String? price = model.price!.value.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match match) => 'от ${match[1]} ',
            ) +
        ' ₽';

    final arrival = DateTime.parse(model.arrival?.date as String);
    final departure = DateTime.parse(model.departure?.date as String);

    final flight = DepartureArrival(arrival, departure);
    final formattedDuration = flight.getFormattedDuration();
    final formattedDurationList = formattedDuration.split(', ').toList();

    // print(formattedDuration); // Выведет: '12:00-15:35   3.5ч в пути'

    // String time = model.timeRange?.join(' ') ?? '';
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 125.v,
        width: 328.h,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 16.h, bottom: 16.v, top: 8.v),
                decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.v),
                    Text(price, style: CustomTextStyles.titleLarge22),
                    SizedBox(height: 14.v),
                    Row(
                      children: [
                        Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.only(
                            top: 7.v,
                            bottom: 6.v,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.redA200,
                            borderRadius: BorderRadius.circular(
                              12.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${formattedDurationList[0]}',
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontStyle: FontStyle.italic),
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                // '111111',
                                model.departure?.airport ?? '',
                                style:
                                    CustomTextStyles.titleSmallPrimaryContainer,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 1.v,
                          width: 10.h,
                          margin: EdgeInsets.only(
                            left: 2.h,
                            top: 9.v,
                            bottom: 27.v,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${formattedDurationList[1]}',
                                // model.time1!,
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontStyle: FontStyle.italic),
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                model.arrival?.airport ?? '',
                                // model.destination1!,
                                style:
                                    CustomTextStyles.titleSmallPrimaryContainer,
                              )
                            ],
                          ),
                        ),
                        model.hasTransfer == false
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: 13.h,
                                  bottom: 25.v,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${formattedDurationList[2]}',
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                      TextSpan(
                                        text: "lbl30".tr,
                                        style: CustomTextStyles
                                            .bodyMediumPrimaryContainer,
                                      ),
                                      TextSpan(
                                        text: "lbl31".tr,
                                        style: theme.textTheme.bodyMedium,
                                      )
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            model.badge != null
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 126.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                        vertical: 1.v,
                      ),
                      decoration: AppDecoration.fillBlue.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder8,
                      ),
                      child: Text(
                        model.badge ?? '',
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
