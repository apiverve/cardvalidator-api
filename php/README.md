# Card Validator API - PHP Package

Card Validator checks whether a card number is valid, identifies the card brand, and flags risk. It runs the Luhn checksum, detects the scheme (Visa, Mastercard, Amex and more), returns the PCI-safe BIN and last 4 digits, flags known processor test cards, and returns a composite risk score.

## Installation

Install via Composer:

```bash
composer require apiverve/cardvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Cardvalidator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['number' => '4900264223817524']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Cardvalidator\Client;
use APIVerve\Cardvalidator\Exceptions\APIException;
use APIVerve\Cardvalidator\Exceptions\ValidationException;

try {
    $response = $client->execute(['number' => '4900264223817524']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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
    "brand": "Visa",
    "cardNumber": "4900264223817524",
    "bin": "490026",
    "last4": "7524",
    "isValid": true,
    "isPotentiallyValid": true,
    "isTestCard": false,
    "riskScore": 0,
    "riskLevel": "low"
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/cardvalidator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/cardvalidator?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/cardvalidator?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
