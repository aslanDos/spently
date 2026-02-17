import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spently/core/shared/enums/icon_type/app_icon_type.dart';

extension AppIconMapper on AppIconType {
  IconData icon(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    switch (this) {
      case AppIconType.add:
        return isIOS ? CupertinoIcons.add : Icons.add;
      case AppIconType.bank:
        return isIOS ? CupertinoIcons.building_2_fill : Icons.account_balance;

      case AppIconType.wallet:
        return isIOS ? CupertinoIcons.wand_rays : Icons.account_balance_wallet;

      case AppIconType.card:
        return isIOS ? CupertinoIcons.creditcard_fill : Icons.credit_card;

      case AppIconType.cash:
        return isIOS
            ? CupertinoIcons.money_dollar_circle_fill
            : Icons.attach_money;

      case AppIconType.crypto:
        return isIOS
            ? CupertinoIcons.bitcoin_circle_fill
            : Icons.currency_bitcoin;

      case AppIconType.savings:
        return isIOS ? CupertinoIcons.archivebox_fill : Icons.savings;

      case AppIconType.investment:
        return isIOS ? CupertinoIcons.chart_bar_fill : Icons.show_chart;

      case AppIconType.business:
        return isIOS ? CupertinoIcons.briefcase_fill : Icons.business;

      case AppIconType.shopping:
        return isIOS ? CupertinoIcons.cart_fill : Icons.shopping_cart;

      case AppIconType.food:
        return isIOS ? CupertinoIcons.bag_fill : Icons.restaurant;

      case AppIconType.transport:
        return isIOS ? CupertinoIcons.car_fill : Icons.directions_car;

      case AppIconType.health:
        return isIOS ? CupertinoIcons.heart_fill : Icons.favorite;

      case AppIconType.education:
        return isIOS ? CupertinoIcons.book_fill : Icons.school;

      case AppIconType.gift:
        return isIOS ? CupertinoIcons.gift_fill : Icons.card_giftcard;
    }
  }

  String get value => name;

  static AppIconType fromString(String value) {
    return AppIconType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AppIconType.wallet,
    );
  }
}
