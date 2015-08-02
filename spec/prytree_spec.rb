require 'spec_helper'

describe PryTree do
  it 'has a version number' do
    expect(PryTree::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(pry_eval('tree Pry')).to match /Pry.*Command.*History.*REPL.*Terminal/m
  end
end
