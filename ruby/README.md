# Card Validator API - Ruby Gem

Card Validator is a credit card number validator API: it checks whether a card number is valid, identifies the card brand, and flags risk. It runs the Luhn checksum, detects the scheme (Visa, Mastercard, Amex and more), returns the PCI-safe BIN and last 4 digits, flags known processor test cards, and returns a composite risk score.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_cardvalidator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_cardvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_cardvalidator'

# Initialize the client
client = APIVerve::Cardvalidator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ number: "4900264223817524" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ number: "4900264223817524" })
  puts response["data"]
rescue APIVerve::Cardvalidator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Cardvalidator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Cardvalidator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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
    "cardNumber": "************7524",
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/cardvalidator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/cardvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/cardvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
