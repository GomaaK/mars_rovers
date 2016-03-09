require 'spec_helper'

describe MarsRovers do
  it 'has a version number' do
    expect(MarsRovers::VERSION).not_to be nil
  end

  it 'passes the test cases' do
    runner = MarsRovers::Runner.new('5 5')
    runner.init_rover('1 2 N')
    runner.move_rover('LMLMLMLMM')
    puts runner.output
    puts runner.output == '1 3 N'
    expect(runner.output).to  eq('1 3 N')
    runner.init_rover('3 3 E')
    runner.move_rover('MMRMMRMRRM')
    puts runner.output
    expect(runner.output).to  eq('5 1 E')
  end
end
