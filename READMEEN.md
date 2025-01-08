

### **README.md in English**  
```markdown
# VippsIntegration

VippsIntegration is a Ruby gem that simplifies integrating Vipps into a Ruby on Rails application.

## Installation

Add the gem to your `Gemfile`:

```ruby
gem 'vipps_integration'
```

Install it by running:

```bash
bundle install
```

## Configuration

Create an initializer file to configure VippsIntegration. Add the following in `config/initializers/vipps.rb`:

```ruby
VippsIntegration.configure do |config|
  config.client_id = ENV['VIPPS_CLIENT_ID']
  config.client_secret = ENV['VIPPS_CLIENT_SECRET']
  config.merchant_id = ENV['VIPPS_MERCHANT_ID']
  config.base_url = "https://api.vipps.no"
end
```

Ensure the environment variables `VIPPS_CLIENT_ID`, `VIPPS_CLIENT_SECRET`, and `VIPPS_MERCHANT_ID` are set in your project.

## Using the API Client

To use the API client, create a new instance of `VippsIntegration::Client`:

```ruby
client = VippsIntegration::Client.new

# Create a payment
response = client.create_payment(
  order_id: "12345",
  amount: 10000, # Amount in cents
  callback_url: "https://yourapp.com/callback"
)

puts response
```

## License

VippsIntegration is distributed under the MIT license.
```

---