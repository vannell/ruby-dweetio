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

        def last(&block)
            uri = URI("#{URL}/get/latest/dweet/for/#{@name}")
            res = Net::HTTP.get_response uri
            
            if res.is_a? Net::HTTPSuccess        
                collection = DweetParser.parse_raw(res.body)

                if block_given?
                    block.call collection.first
                else
                    return collection.first if ! collection.empty?
                end
            end

            nil
        end

        def all
        end
    end
end
