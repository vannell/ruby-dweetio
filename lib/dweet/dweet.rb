module Dweet
    class Dweet
        attr_accessor :thing, :created, :content

        def initialize
        end

        def ==(other)
            self.thing == other.thing &&
                self.created == other.created &&
                self.content == other.content
        end
    end
end
