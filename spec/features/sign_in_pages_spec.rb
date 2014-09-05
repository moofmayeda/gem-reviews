require 'rails_helper'

describe "the sign up process" do
  before :each do
    DatabaseCleaner.clean
    visit '/users/sign_up'
  end

  it "succeeds with a unique name, email, and password" do
    fill_in 'Name', with: 'moof'
    fill_in 'Email', with: 'moof@moof.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'moof'
  end

  it "fails without an email" do
    fill_in 'Name', with: 'moof'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end
end
