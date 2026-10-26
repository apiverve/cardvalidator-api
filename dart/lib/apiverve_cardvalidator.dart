/// Card Validator API client for Dart/Flutter
///
/// Card Validator is a credit card number validator API: it checks whether a card number is valid, identifies the card brand, and flags risk. It runs the Luhn checksum, detects the scheme (Visa, Mastercard, Amex and more), returns the PCI-safe BIN and last 4 digits, flags known processor test cards, and returns a composite risk score.
///
/// For more information, visit: https://apiverve.com/marketplace/cardvalidator?utm_source=dart&utm_medium=referral&utm_content=readme
library apiverve_cardvalidator;

export 'src/client.dart';
export 'src/models.dart';
