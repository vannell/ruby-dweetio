# Dweet

Ruby gem for querying your dweet.io things !

## Installation

Add this line to your application's Gemfile:

    gem 'dweet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dweet

## Usage

Create your Thing

    thing = Thing.new "CoffeeMachine"

Create a dweet and affect a Hash as content

    status = Dweet.new
    status.content = { :coffee_ready => true, :amount => "2 cups" }

Publish it!

    result_status = thing.publish status
    puts result_status.created

Retrieve all dweets for your Thing

    things.all do |dweet|
        puts dweet.content["coffee_ready"]
    end

    #or in another way with a more global interface

    DweetIO.all_for("CoffeeMachine)

Retrieve last known dweet for your Thing

    thing.last do |dweet|
        puts dweet.content["coffee_ready"]
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
