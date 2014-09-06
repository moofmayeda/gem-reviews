require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "creating a review for a gem" do
  it "is successful if a user is signed in", js:true do
    Warden.test_reset!
    DatabaseCleaner.clean
    test_user = FactoryGirl.create(:user)
    login_as(test_user, :scope => :user)
    test_gem = FactoryGirl.create(:jewel)
    visit '/'
    click_link 'gemgem'
    click_link 'Add a review'
    fill_in 'Title', with: 'Awesome!'
    fill_in 'Text', with: 'It really is great'
    click_button 'Create Review'
    expect(page).to have_content('It really is great')
  end
end

