#
# a representation of the plateaue on which rovers hover
#
class MarsRovers::Plateau
  def initialize(width, height)
    @width, @height = width.to_i, height.to_i
  end
  #
  # returns whether this point is inbound of the plateau or not
  #
  def valid?(whereabouts)
    @width >= whereabouts.x and @height >= whereabouts.y
  end
end