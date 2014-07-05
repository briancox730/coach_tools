require 'rails_helper'

feature "user signs out", %q{
  As a User
  I want to sign out
  So that other people can't use my account
} do

  scenario "user signs out" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_on "Sign out"

    expect(page).to have_content "Signed out successfully."
  end
end
