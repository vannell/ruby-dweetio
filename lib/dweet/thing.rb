require 'net/http'
require_relative './dweet_parser.rb'

module Dweet
    URL = 'http://dweet.io'

    class Thing
        attr_accessor :name

        def initialize(name=nil)
            @name = name
        end

        def publish(dweet)
            if @name.nil?
                uri = URI("#{URL}/dweet")
            else
                uri = URI("#{URL}/dweet/for/#{@name}")
            end
            uri.query = URI.encode_www_form dweet.content

            res = Net::HTTP.get_response uri
            if res.is_a? Net::HTTPSuccess
                DweetParser.parse_raw res.body 
            else
                nil
            end
        end

        def last
            uri = URI("#{URL}/get/latest/dweet/for/#{@name}")
            res = Net::HTTP.get_response uri
            
            DweetParser.parse_raw res.body if res.is_a? Net::HTTPSuccess        
        end

        def all
        end
    end
end
