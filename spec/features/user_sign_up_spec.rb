require 'spec_helper'

feature "user signs up", %q{
  As a User
  I want to register an account
  So that I can be identified on the website by other Users
} do

  # Acceptance Criteria

  # - I must provide my email, a password, and a password confirmation
  # - I see an error message if I do not provide all required information

  scenario "user signs up with valid information" do
    visit new_user_registration_path

    fill_in "Email", with: "meow@meow.com"
    fill_in "Password", with: "meow1234"
    fill_in "Password confirmation", with: "meow1234"
    click_on "Sign up"

    expect(page).to have_content "Meow! You have signed up successfully."
  end

  scenario "user signs up without required information" do
    visit new_user_registration_path

    click_on "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
