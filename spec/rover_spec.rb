require 'spec_helper'

describe MarsRovers::Rover do
  subject {MarsRovers::Rover.new(0, 0, 'N', MarsRovers::Plateau.new(5,5))}

  it 'has whereabouts' do
    expect(subject.whereabouts.to_s).to eq('0 0 N')
  end

  it 'can move forward' do
    subject.forward
    expect(subject.whereabouts.to_s).to eq('0 1 N')
  end

  it 'can rotate right' do
    subject.rotate('R')
    expect(subject.orientation).to eq('E')

    subject.rotate('R')
    expect(subject.orientation).to eq('S')

    subject.rotate('R')
    expect(subject.orientation).to eq('W')

    subject.rotate('R')
    expect(subject.orientation).to eq('N')
  end

  it 'can rotate left' do
    subject.rotate('L')
    expect(subject.orientation).to eq('W')

    subject.rotate('L')
    expect(subject.orientation).to eq('S')

    subject.rotate('L')
    expect(subject.orientation).to eq('E')

    subject.rotate('L')
    expect(subject.orientation).to eq('N')
  end

  it 'can crash' do
    subject.forward(7)
    expect(subject.whereabouts.to_s).to eq('Crashed!')
    subject.rotate('R')
    subject.forward
    expect(subject.whereabouts.to_s).to eq('Crashed!')
  end

end
