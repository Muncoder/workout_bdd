require "rails_helper"

RSpec.feature "Showing Article" do
	before do
		@john = User.create!(email: "john@example.com", password: "password")
		login_as(@john)
		@article1 = @john.articles.create(title: "This first article", body: "body of first article")
	end

	scenario "show individual article" do
		visit "/"

		click_link @article1.title

		expect(page).to have_content(@article1.title)
		expect(page).to have_content(@article1.body)
		expect(current_path).to eq(article_path(@article1))

		click_link "Go Home"
	end
end