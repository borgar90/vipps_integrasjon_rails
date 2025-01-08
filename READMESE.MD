
### **README.md på Svensk**  
```markdown
# VippsIntegration

VippsIntegration är en Ruby-gem som gör det enkelt att integrera Vipps i en Ruby on Rails-applikation.

## Installation

Lägg till gem-en i din `Gemfile`:

```ruby
gem 'vipps_integration'
```

Installera den genom att köra:

```bash
bundle install
```

## Konfiguration

Skapa en initializer-fil för att konfigurera VippsIntegration. Lägg till följande i `config/initializers/vipps.rb`:

```ruby
VippsIntegration.configure do |config|
  config.client_id = ENV['VIPPS_CLIENT_ID']
  config.client_secret = ENV['VIPPS_CLIENT_SECRET']
  config.merchant_id = ENV['VIPPS_MERCHANT_ID']
  config.base_url = "https://api.vipps.no"
end
```

Se till att du har ställt in miljövariablerna `VIPPS_CLIENT_ID`, `VIPPS_CLIENT_SECRET` och `VIPPS_MERCHANT_ID`.

## Användning av API-klienten

För att använda API-klienten, skapa en ny instans av `VippsIntegration::Client`:

```ruby
client = VippsIntegration::Client.new

# Skapa en betalning
response = client.create_payment(
  order_id: "12345",
  amount: 10000, # Belopp i öre
  callback_url: "https://dinapp.se/callback"
)

puts response
```

## Licens

VippsIntegration distribueras under MIT-licensen.
```

---