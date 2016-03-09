require 'spec_helper'

describe MarsRovers::Whereabouts do
  subject {MarsRovers::Whereabouts.new(5, 5, 'N')}

  it 'has string representation' do
    expect(subject.to_s).to eq('5 5 N')
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

  it 'can move forward' do
    subject.forward
    expect(subject.to_s).to eq('5 6 N')
  end

end
