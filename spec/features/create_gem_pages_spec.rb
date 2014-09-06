require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "adding a new gem" do
  before :each do
    Warden.test_reset!
    DatabaseCleaner.clean
    @test_user = FactoryGirl.create(:user)
  end

  it "is successful if a user is signed in", js:true do
    login_as(@test_user, :scope => :user)
    visit '/'
    click_link 'Add a gem'
    fill_in 'Name', with: 'sparklebob'
    fill_in 'Url', with: 'sparklebob.com'
    click_button 'Create Jewel'
    expect(page).to have_content 'sparklebob'
  end

  it "fails if a user is not signed in" do
    visit '/'
    click_link 'Add a gem'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end
