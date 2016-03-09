class MarsRovers::Crashed < MarsRovers::Whereabouts
  #
  # this is just to override the to_s method
  # this will make sure if something crashed it will say nothing but that
  # for the rest of the run for a given rover
  #
  def to_s
    "Crashed!"
  end
end