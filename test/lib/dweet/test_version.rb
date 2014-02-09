require_relative '../../test_helper'

describe Dweet do

    it "must be defined" do
        Dweet::VERSION.wont_be_nil
    end

end
