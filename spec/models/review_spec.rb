require 'rails_helper'

describe Review do
  before :each do
    DatabaseCleaner.clean
  end

  it { should belong_to :user }
  it { should belong_to :jewel }
end
