import 'package:spently/core/shared/enums/icon_category/app_icon_category.dart';
import 'package:spently/core/shared/enums/icon_type/app_icon_type.dart';

extension IconCategoryMapper on AppIconType {
  IconCategory get category {
    switch (this) {
      // ===== FINANCE =====
      case AppIconType.wallet:
      case AppIconType.walletMinimal:
      case AppIconType.walletCards:
      case AppIconType.piggyBank:
      case AppIconType.landmark:
      case AppIconType.scale:
      case AppIconType.receipt:
      case AppIconType.chartCandleStick:
      case AppIconType.banknote:
      case AppIconType.currency:
      case AppIconType.dollarSign:
      case AppIconType.gem:
      case AppIconType.handCoins:
      case AppIconType.handShake:
      case AppIconType.buisnessCase:
        return IconCategory.finance;

      // ===== FOOD =====
      case AppIconType.apple:
      case AppIconType.banana:
      case AppIconType.bean:
      case AppIconType.beef:
      case AppIconType.beer:
      case AppIconType.bearOff:
      case AppIconType.bottleWine:
      case AppIconType.cake:
      case AppIconType.cakeSlice:
      case AppIconType.candy:
      case AppIconType.candyCane:
      case AppIconType.carrot:
      case AppIconType.chefHat:
      case AppIconType.cherry:
      case AppIconType.citrus:
      case AppIconType.coffee:
      case AppIconType.cookie:
      case AppIconType.popcorn:
      case AppIconType.pizza:
      case AppIconType.utensils:
        return IconCategory.food;

      // ===== SHOPPING =====
      case AppIconType.barcode:
      case AppIconType.bookImage:
      case AppIconType.circlePercent:
      case AppIconType.diamondPercent:
      case AppIconType.handbag:
      case AppIconType.percent:
      case AppIconType.scan:
      case AppIconType.scanBarcode:
      case AppIconType.scanLine:
      case AppIconType.scanQrCode:
      case AppIconType.shirt:
      case AppIconType.shoppingBag:
      case AppIconType.shoppingBasket:
      case AppIconType.shoppingCart:
      case AppIconType.squarePercent:
      case AppIconType.store:
        return IconCategory.shopping;

      // ===== TRANSPORT =====
      case AppIconType.car:
      case AppIconType.bus:
      case AppIconType.trainFront:
      case AppIconType.plane:
      case AppIconType.ship:
      case AppIconType.motorbike:
      case AppIconType.fuel:
      case AppIconType.evCharger:
      case AppIconType.circleParking:
      case AppIconType.trafficCone:
      case AppIconType.tractor:
      case AppIconType.ticket:
      case AppIconType.ticketsPlane:
      case AppIconType.luggage:
      case AppIconType.briefcase:
        return IconCategory.transport;

      // ===== HOME =====
      case AppIconType.house:
      case AppIconType.houseHeart:
      case AppIconType.housePlug:
      case AppIconType.houseWifi:
      case AppIconType.bedDouble:
      case AppIconType.sofa:
      case AppIconType.armchair:
      case AppIconType.cookingPot:
      case AppIconType.refrigerator:
      case AppIconType.microwave:
      case AppIconType.showerHead:
      case AppIconType.toilet:
      case AppIconType.washingMachine:
      case AppIconType.lamp:
      case AppIconType.heater:
      case AppIconType.router:
      case AppIconType.solarPanel:
      case AppIconType.hammer:
      case AppIconType.graduationHat:
      case AppIconType.toolbox:
      case AppIconType.gift:
      case AppIconType.laptop:
        return IconCategory.home;

      // ===== SCIENCE =====
      case AppIconType.activity:
      case AppIconType.atom:
      case AppIconType.beaker:
      case AppIconType.brain:
      case AppIconType.brainCircuit:
      case AppIconType.circuitBoard:
      case AppIconType.flaskConical:
      case AppIconType.microscope:
      case AppIconType.orbit:
      case AppIconType.pipette:
      case AppIconType.radiation:
      case AppIconType.satellite:
      case AppIconType.stethoscope:
      case AppIconType.syringe:
      case AppIconType.telescope:
        return IconCategory.science;

      // ===== HEALTH =====
      case AppIconType.ambulance:
      case AppIconType.bandage:
      case AppIconType.bone:
      case AppIconType.briefcaseMedical:
      case AppIconType.dna:
      case AppIconType.heart:
      case AppIconType.heartPulse:
      case AppIconType.hospital:
      case AppIconType.pill:
      case AppIconType.pillBottle:
      case AppIconType.ribbon:
        return IconCategory.health;

      // ===== TRAVEL =====
      case AppIconType.backpack:
      case AppIconType.baggageClaim:
      case AppIconType.bath:
      case AppIconType.binoculars:
      case AppIconType.cableCar:
      case AppIconType.caravan:
      case AppIconType.compass:
      case AppIconType.conciergeBell:
      case AppIconType.helicopter:
      case AppIconType.hotel:
      case AppIconType.mapPin:
      case AppIconType.sailboat:
      case AppIconType.tent:
      case AppIconType.towerControl:
        return IconCategory.travel;

      // ===== SPORT =====
      case AppIconType.award:
      case AppIconType.circleStar:
      case AppIconType.dumbbell:
      case AppIconType.fishingHook:
      case AppIconType.handFist:
      case AppIconType.medal:
      case AppIconType.trophy:
      case AppIconType.volleyball:
      case AppIconType.wavesLadder:
        return IconCategory.sport;
    }
  }
}
