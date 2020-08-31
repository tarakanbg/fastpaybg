# FASTPAY

Rails-specific library for working with the Fastpay.bg API.

## Installation

Add this line to your application's Gemfile:

    gem 'fastpaybg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fastpaybg

## Configuration

Create the config file `config/fastpaybg.yml` with the following contents:

```yml
production:
  secret: YOUR-SECRET-KEY
  min: YOUR-MIN
  url: "https://epay.bg"
  url_idn: "https://epay.bg/ezp/reg_bill.cgi"

test:
  secret: YOUR-SECRET-KEY
  min: YOUR-MIN
  url: "https://demo.epay.bg"
  url_idn: "https://demo.epay.bg/ezp/reg_bill.cgi"
```

Set the mode to production in your `config/environments/production.rb` file:

```ruby
# Add to bottom of the file
Fastpaybg.mode = :production
```

## Usage
Handle a response callback from FastpayBG:

```ruby
response = Fastpaybg::Response.new params[:encoded], params[:checksum]
response.valid?
# => true

response.status
# => "PAID"
```

Respond to their callback:

```ruby
response = Fastpaybg::Response.new(params[:encoded], params[:checksum])

response.invoice
=> "f5b1eaf"

response.response_for(:ok)
=> "INVOICE=f5b1eaf:STATUS=PAID"
```

