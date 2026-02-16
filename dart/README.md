# Card Validator API - Dart/Flutter Client

Card Validator is a simple tool for validating if a card number is valid or not. It checks the card number format and the Luhn algorithm to see if the card number is valid.

[![pub package](https://img.shields.io/pub/v/apiverve_cardvalidator.svg)](https://pub.dev/packages/apiverve_cardvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Card Validator API](https://apiverve.com/marketplace/cardvalidator?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_cardvalidator: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_cardvalidator/apiverve_cardvalidator.dart';

void main() async {
  final client = CardvalidatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'number': '4900264223817524'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "card": {
      "niceType": "Visa",
      "type": "visa",
      "patterns": [
        4
      ],
      "gaps": [
        4,
        8,
        12
      ],
      "lengths": [
        16,
        18,
        19
      ],
      "code": {
        "name": "CVV",
        "size": 3
      },
      "matchStrength": 1
    },
    "cardNumber": "4900264223817524",
    "isValid": true
  }
}
```

## API Reference

- **API Home:** [Card Validator API](https://apiverve.com/marketplace/cardvalidator?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/cardvalidator](https://docs.apiverve.com/ref/cardvalidator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
