require 'rails_helper'

feature "user signs in", %q{
  As a User
  I want to sign in
  So that I can be identified on the website by other Users
} do

  # Acceptance Criteria
  #
  # - I must provide my email and password
  # - I see an error message if I do not provide valid credentials

  scenario "user signs in with valid credentials" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "user signs in with invalid credentials" do
    visit new_user_session_path
    click_on "Sign in"

    expect(page).to have_content "Invalid email or password."
  end
end
