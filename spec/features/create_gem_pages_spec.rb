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
    # login_as(@test_user, :scope => :user)
    visit '/'
    click_link 'Login'
    fill_in 'Name', with: 'moof'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Add a gem'
    fill_in 'Name', with: 'sparklebob'
    fill_in 'Url', with: 'sparklebob.com'
    click_button 'Create Jewel'
    expect(page).to have_content 'sparklebob'
  end
end
