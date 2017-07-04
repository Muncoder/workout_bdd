require "rails_helper"

RSpec.feature "deleting article" do
	before do
		@john = User.create!(email: "john@example.com", password: "password")
		login_as(@john)
		@article = @john.articles.create(title: "This first article", body: "body of first article")
	end

	scenario "delete article" do
		visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Article has been deleted")
		expect(current_path).to eq(articles_path)
	end

end 