require "rails_helper"

RSpec.feature "editing article" do

	before do
		@article = Article.create(title: "THis is title", body: "this is the body")
	end

	scenario "a user updates an article" do
		visit "/"

		click_link @article.title
		click_link "Edit Article"

		fill_in "Title", with: "Updated article"
		fill_in "Body", with: "Updated body of article"
		click_button "Update Article"

		expect(page).to have_content("Article has been updated")
		expect(page.current_path).to eq(article_path(@article))
	end

	scenario "A user fails to update an article" do
		visit "/"

		click_link @article.title
		click_link "Edit Article"

		fill_in "Title", with: ""
		fill_in "Body", with: "Updated body of article"
		click_button "Update Article"

		expect(page).to have_content("Article has not been updated")
		expect(page.current_path).to eq(article_path(@article))
	end


end