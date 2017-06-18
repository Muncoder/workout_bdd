require "rails_helper"

RSpec.feature "deleting article" do
	before do
		@article = Article.create(title: "This first article", body: "body of first article")
	end

	scenario "delete article" do
		visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Article has been deleted")
		expect(current_path).to eq(articles_path)
	end

end 