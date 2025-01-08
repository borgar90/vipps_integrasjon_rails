### **README.md på Norsk**  

# VippsIntegration

VippsIntegration er en Ruby-gem som gjør det enkelt å integrere Vipps i en Ruby on Rails-applikasjon.

## Installasjon

Legg til gem-en i `Gemfile`:

```ruby
gem 'vipps_integration'
```

Installer den ved å kjøre:

```bash
bundle install
```

## Konfigurasjon

Opprett en initializer-fil for å konfigurere VippsIntegration. Legg for eksempel til følgende i `config/initializers/vipps.rb`:

```ruby
VippsIntegration.configure do |config|
  config.client_id = ENV['VIPPS_CLIENT_ID']
  config.client_secret = ENV['VIPPS_CLIENT_SECRET']
  config.merchant_id = ENV['VIPPS_MERCHANT_ID']
  config.base_url = "https://api.vipps.no"
end
```

Pass på at du har satt miljøvariablene `VIPPS_CLIENT_ID`, `VIPPS_CLIENT_SECRET` og `VIPPS_MERCHANT_ID` i prosjektet ditt.

## Bruk av API-klienten

For å bruke API-klienten, opprett en ny instans av `VippsIntegration::Client`:

```ruby
client = VippsIntegration::Client.new

# Opprett en betaling
response = client.create_payment(
  order_id: "12345",
  amount: 10000, # Beløp i øre
  callback_url: "https://dinapp.no/callback"
)

puts response
```

## Tilpasning av språk (i18n)

VippsIntegration støtter oversettelser gjennom Rails i18n. Standardtekst for transaksjoner kan oversettes ved å definere en nøkkel i dine egne oversettelsesfiler:

```yaml
nb:
  vipps_integration:
    transaction_text: "Betaling for bestilling #{order_id}"
```
   
Du kan også endre standardspråket ved å sette I18n.default_locale i applikasjonen din:

I18n.default_locale = :nb


## Lisens

VippsIntegration er distribuert under MIT-lisensen.


