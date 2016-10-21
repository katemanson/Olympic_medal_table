require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative ('../models/country.rb')

class TestCountry < Minitest::Test

  def setup
    options = {
      'id' => "3",
      'name' => "Far-off Jebrovia"
    }
    @country = Country.new(options)  
  end

  def test_name
    assert_equal("Far-off Jebrovia", @country.name)
  end

end