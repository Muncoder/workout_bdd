require "rails_helper"

RSpec.feature "Showing Article" do
	before do
		@article1 = Article.create(title: "This first article", body: "body of first article")
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