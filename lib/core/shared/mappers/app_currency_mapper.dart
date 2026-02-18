extension CurrencyExtension on String {
  String get symbol {
    switch (this) {
      case 'KZT':
        return '₸';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'RUB':
        return '₽';
      default:
        return this;
    }
  }
}
