require("minitest/autorun")
require('minitest/reporters')
require_relative("../house")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestHouse < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Gryffindor"}

    @house = House.new(options)
  end

  def test_name()
    assert_equal("Gryffindor", @house.name)
  end

end
