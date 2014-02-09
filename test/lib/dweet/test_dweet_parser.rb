require_relative '../../test_helper.rb'
require 'date'

describe Dweet do

    before do
        @valid_input =<<EOF
{"this":"succeeded","by":"getting","the":"dweets","with":[{"thing":"better-earthquake","created":"2014-02-08T16:30:41.319Z","content":{"hello":"world","foo":"baz"}}]}
EOF
        @valid_dweet = Dweet::Dweet.new
        @valid_dweet.thing = 'better-earthquake'
        @valid_dweet.content = { "hello" => "world", "foo" => "baz" }
        @valid_dweet.created = DateTime.parse("2014-02-08T16:30:41.319Z") 
        @invalid_input=<<EOF
{"this":"failed","with":404,"because":"the thing couldn't be found"}
EOF
    end

    describe "when ask to parse a valid answer" do
        it "should return an Array of Dweet" do
            Dweet::DweetParser.parse_raw(@valid_input).must_be_instance_of(Array)
        end

        it "should return a dweet with correct asscoiated properties" do
            dweet = Dweet::DweetParser.parse_raw(@valid_input).first
            dweet.wont_be_nil
            @valid_dweet.must_equal dweet
        end
    end

    describe "when ask to parse an invalid answer" do
        it "should return nothing for a non existing dweet" do
            Dweet::DweetParser.parse_raw(@invalid_input).must_be_nil
        end
    end
end
