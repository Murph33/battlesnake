class GameObject
  def initialize(attributes = {})
    self.new.assign_attributes attributes
  end

  def assign_attributes(attributes = {})
    self.tap do |board|
      attributes.each { |key, value| self.send "#{ key }=", value }
    end
  end
end
