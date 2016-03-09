require 'forwardable'
#
# a representation of the rover
#
class MarsRovers::Rover
  extend Forwardable
  #
  # will delegate the rotate to the whereabouts class
  #
  def_delegators :@whereabouts, :rotate
  def_delegators :@whereabouts, :orientation
  attr_reader :whereabouts

  def initialize(x, y, orientation, plateau)
    @whereabouts = MarsRovers::Whereabouts.new(x, y, orientation)
    @plateau = plateau
  end
  #
  # will crash if came out of bounds
  #
  def forward(n=1)
    @whereabouts.forward(n)
    unless @plateau.valid?(@whereabouts)
      @whereabouts = MarsRovers::Crashed.new(*@whereabouts.attributes)
    end
  end


end