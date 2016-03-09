#
# parses and executes everything
#
class MarsRovers::Runner
  #
  # given the size of the plateau it initiates it
  #
  def initialize(string)
    @plateau = MarsRovers::Plateau.new(*prepare(string))
  end
  #
  # given the string of the initial state of a rover
  # it is initiated
  #
  def init_rover(string)
    @current_rover = MarsRovers::Rover.new(*(prepare(string) + [@plateau]))
  end
  #
  # given the whole string of movement of the rover
  # it calculates the final possition of the rover
  #
  def move_rover(string)
    string.each_char do |c|
      if c == 'M'
        @current_rover.forward
      else
        @current_rover.rotate(c)
      end
    end
  end
  #
  # outputs the location of the rover
  #
  def output
    @current_rover.whereabouts.to_s
  end

  private
  #
  # any preparation to the input should be here
  #
  def prepare(string)
    string.split(' ')
  end
end