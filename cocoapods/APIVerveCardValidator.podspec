Pod::Spec.new do |s|
  s.name             = 'APIVerveCardValidator'
  s.version          = '1.2.3'
  s.summary          = 'Card Validator is a credit card number validator API: it checks whether a card number is valid, identifies the card brand, and flags risk.'
  s.description      = <<-'DESC'
Card Validator is a credit card number validator API: it checks whether a card number is valid, identifies the card brand, and flags risk. It runs the Luhn checksum, detects the scheme (Visa, Mastercard, Amex and more), returns the PCI-safe BIN and last 4 digits, flags known processor test cards, and returns a composite risk score.

This iOS/macOS SDK provides a convenient way to access the Card Validator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/cardvalidator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/cardvalidator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveCardValidator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
