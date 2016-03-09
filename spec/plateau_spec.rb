require 'spec_helper'

describe MarsRovers::Plateau do
  subject {MarsRovers::Plateau.new(5,5)}
  it 'has bounds' do
    expect(subject.valid?(MarsRovers::Whereabouts.new(6,6))).to eq(false)
    expect(subject.valid?(MarsRovers::Whereabouts.new(5,5))).to eq(true)
  end
end
