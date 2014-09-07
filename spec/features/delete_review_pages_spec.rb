require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "deleting a gem review" do
  it "is successful if a user is signed in", js:true do
    Warden.test_reset!
    DatabaseCleaner.clean
    test_user = FactoryGirl.create(:user)
    login_as(test_user, :scope => :user)
    test_gem = FactoryGirl.create(:jewel)
    test_review = FactoryGirl.create(:review, user_id: test_user.id, jewel_id: test_gem.id)
    visit jewel_path(test_gem)
    within("#review_#{test_review.id}") do
      click_link 'Delete'
    end
    expect(page).to have_no_content('It really is great')
  end
end

