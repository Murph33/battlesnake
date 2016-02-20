class Board
  attr_accessor :width, :height, :snakes, :food, :walls, :gold

  def initialize(width: nil, height: nil, snakes: nil, food: nil, walls: nil, gold: nil)
    @width, @height, @snakes, @food, @walls, @gold =
      width, height, snakes, food, walls, gold
  end

  def self.create(attributes = {})
    self.new.assign_attributes attributes
  end

  def assign_attributes(attributes = {})
    self.tap do |board|
      attributes.each { |key, value| self.send "#{ key }=", value }
    end
  end
end
