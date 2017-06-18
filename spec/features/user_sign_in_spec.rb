require "rails_helper"

RSpec.feature "User Sign in Spec" do
	before do
		@john = User.create(email: "john@example.com", password: "password")
	end

	scenario "with valid credential" do
		visit "/"

		click_link "Sign In"

		fill_in "Email", with: @john.email
		fill_in "Password", with: @john.password

		click_button "Log in"

		expect(page).to have_content("Signed in successfully.")
		expect(page).to have_content(@john.email)
	end


end