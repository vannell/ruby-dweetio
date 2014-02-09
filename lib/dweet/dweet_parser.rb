require 'date'
require 'dweet'
require 'json'

module Dweet
    class DweetParser
        def self.parse_raw(ans)
            h = JSON.parse(ans)

            if h["this"] == "succeeded"
                if h["with"].is_a? Array
                    h["with"].map do |dweet_str|
                        parse dweet_str
                    end
                else
                    parse h["with"]
                end
            else
                nil
            end
        end

        def self.parse(dweet_str)
            dweet = Dweet.new 
            dweet.thing = dweet_str["thing"]
            dweet.created = DateTime.parse dweet_str["created"]
            dweet.content = dweet_str["content"]
            dweet
        end
    end
end
