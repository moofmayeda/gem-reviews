require 'rails_helper'

describe Jewel do
  before :each do
    DatabaseCleaner.clean
  end

  it { should have_many :reviews }
end
