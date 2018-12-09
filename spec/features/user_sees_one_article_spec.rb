require 'rails_helper'

describe 'user sees one article do' do
  describe 'they link from the articles index' do
    it 'should see article information' do
      article = Article.create!(title: "Title 1", body: "Body 1")
      
      visit articles_path
      
      click_link article.title
      
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end