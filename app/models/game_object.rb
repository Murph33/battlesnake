class GameObject
  def initialize(attributes = {})
    assign_attributes attributes
  end

  def assign_attributes(attributes = {})
    self.tap do |board|
      attributes.each { |key, value| self.send "#{ key }=", value }
    end
  end
end


# {
#     "game": "hairy-cheese",
#     "mode": "advanced",
#     "turn": 4,
#     "height": 20,
#     "width": 30,
#     "snakes": [
#         <Snake Object>, <Snake Object>, ...
#     ],
#     "food": [
#         [1, 2], [9, 3], ...
#     ],
#     "walls": [    // Advanced Only
#         [2, 2]
#     ],
#     "gold": [     // Advanced Only
#         [5, 5]
#     ]
# }
