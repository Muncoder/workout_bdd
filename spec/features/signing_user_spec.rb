require "rails_helper"

RSpec.feature "Signing User" do

	scenario "Sign Up" do
		visit "/"

		click_link "Sign Up"
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"

		click_button "Sign up"

		expect(page).to have_content("Welcome! You have signed up successfully.")

	end
end