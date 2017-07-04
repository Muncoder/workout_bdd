require "rails_helper"

RSpec.feature "Listing Articles" do

	before do
		@john = User.create!(email: "john@example.com", password: "password")
		login_as(@john)

		@article = @john.articles.create(title: "This first article", body: "body of first article")
		@article1 = @john.articles.create(title: "This first article", body: "body of first article")
		@article2 = @john.articles.create(title: "Second Article", body: "body of second article")
	end

	scenario "list of articles" do
		visit "/"
		expect(page).to have_content(@article1.title)
		expect(page).to have_content(@article1.body)
		expect(page).to have_content(@article2.title)
		expect(page).to have_content(@article2.body)
		expect(page).to have_link(@article1.title)
		expect(page).to have_link(@article2.title)
	end

end