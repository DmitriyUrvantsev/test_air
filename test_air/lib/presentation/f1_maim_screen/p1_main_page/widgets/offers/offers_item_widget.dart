import 'package:flutter/material.dart';
import '../../../../../core/app_export.dart';
import '../../../../../domain/offer.dart';
import '../../../provider/air_main_provider.dart';
import '../../models/data/offer_image_model.dart';

class OffersItemWidget extends StatelessWidget {
  final Offers model;

  const OffersItemWidget(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AirScreensProvider>();
    int? id = model.id ?? 1;
    String? price = model.price!.value.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match match) => 'от ${match[1]} ',
            ) +
        ' ₽';
    ;
    OfferImageModel getOfferImageByIdOrLast(
        List<OfferImageModel> itemList, int id) {
      for (var offerImageModel in itemList) {
        if (offerImageModel.id == id) {
          return offerImageModel;
        }
      }
      return itemList.isNotEmpty ? itemList.last : OfferImageModel();
    }

    OfferImageModel result = getOfferImageByIdOrLast(
        provider.mainPageModelObj.offerImageItemList, id);
    print(result.offerImage);
    return SizedBox(
      width: 132.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: result.offerImage,
            height: 133.v,
            width: 132.h,
            radius: BorderRadius.circular(
              16.h,
            ),
          ),
          SizedBox(height: 8.v),
          Container(
            decoration: AppDecoration.outlineBlackF,
            child: Text(
              model.title ?? '',
              style: CustomTextStyles.titleMedium2,
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            model.town ?? '',
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 3.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgAirplane,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.v),
                child: Text(
                  price,
                  style: theme.textTheme.bodyMedium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
