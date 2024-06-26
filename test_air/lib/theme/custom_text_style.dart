import 'package:flutter/material.dart';
import '../core/app_export.dart';

// extension on TextStyle {
//   TextStyle get sFProDisplay {
//     return copyWith(
//       fontFamily: 'SF Pro Display',
//     );
//   }
// }

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodySmallBlue800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue800,
      );
// Title text style
  static get titleLarge22 => TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 22.fSize,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );
  static get titleLarge18 => TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.fSize,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );
  static get titleLargeBluegray100 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray100,
      );
  static get titleMediumBlue800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue800,
      );

  static get titleMedium => TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );
  static get titleMedium2 => TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static get titleMediumPrimaryContainer1 => TextStyle(
        color: theme.colorScheme.primaryContainer,
        fontSize: 16.fSize,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      );

  static get titleSmallBlue800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue800,
      );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
}
