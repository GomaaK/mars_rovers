#
# a representation of the location and orientation
#
class MarsRovers::Whereabouts
  #
  # array containing all possible directions
  #
  DIRECTIONS = ['N', 'E', 'S', 'W']
  #
  # contains all the possible vectors for a forward action
  #
  FORWARD = [[0,1], [1,0], [0, -1], [-1,0]]

  attr_reader :x, :y

  def initialize(x, y, orientation='N')
    @x, @y, @orientation_index = x.to_i, y.to_i, DIRECTIONS.index(orientation)
  end
  #
  # given a diraction it will change its orientation to suite this action
  #
  def rotate(direction)
    self.send("rotate_#{direction.downcase}")
  end
  #
  # returns the current orientation
  #
  def orientation
    DIRECTIONS[@orientation_index]
  end
  #
  # moves forward corresponding to the current orientation
  #
  def forward(n=1)
    vector = FORWARD[@orientation_index]
    n.times do
      @x += vector[0]
      @y += vector[1]
    end
    return [@x, @y]
  end

  def to_s
    "%s %s %s" % attributes
  end
  #
  # all you wana know about this class
  #
  def attributes
    [@x, @y, orientation]
  end

  private 

  def rotate_r
    @orientation_index -= 4 if @orientation_index == 3
    @orientation_index += 1
  end

  def rotate_l
    @orientation_index += 4 if @orientation_index == 0
    @orientation_index -= 1
  end
end