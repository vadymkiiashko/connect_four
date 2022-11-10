require "unit/test"
require_relative "game.rb"

class TestGame < Test::Unit::TestCase
  def test_simple
    assert_equal(4, Game.new())
  end
end
