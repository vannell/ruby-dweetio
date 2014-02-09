require_relative './thing.rb'

module Dweet

class DweetIO
    attr_reader :thing

    def initialize(thing)
        @thing = thing
    end

    class << self
        def all_for(thing)
            Thing.new(thing).all
        end

        def last_for(thing)
            Thing.new(thing).last
        end
    end
end

end
