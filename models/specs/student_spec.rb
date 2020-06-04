require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../student")

class StudentTest < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Harry", "second_name" => "Potter",
    "house" => "Gryffindor", "age" => 14}

    @student = Student.new(options)
  end

  # def test_CR()
  #   assert_equal([@student], Student.all())
  #   assert_equal(@student, Student.find(@student.id))
  # end

  def test_first_name()
    result = @student.first_name()
    assert_equal("Harry", result)
  end

  def test_second_name()
    result = @student.second_name()
    assert_equal("Potter", result)
  end

  def test_house()
    result = @student.house()
    assert_equal("Gryffindor", result)
  end

  def test_age()
    result = @student.age()
    assert_equal(14, result)
  end

end
