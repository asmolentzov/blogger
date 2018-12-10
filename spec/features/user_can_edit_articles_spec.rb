require 'rails_helper'

describe 'As a visitor to an article show page' do
  it 'should be able to click a link and fill out a form to edit an article' do
    article = Article.create!(title: "Title 1", body: "Body 1")
    
    visit article_path(article)
    
    click_link "Edit Article"
    
    expect(current_path).to eq(edit_article_path(article))
    fill_in :article_title, with: "New Title"
    fill_in :article_body, with: "New Body"
    click_button "Update Article"
    
    new_article = Article.find(article.id)
    
    expect(current_path).to eq(article_path(article))
    expect(page).to have_content("New Title")
    expect(page).to have_content("New Body")
    expect(page).to_not have_content("Title 1")
    expect(page).to have_content("Article '#{new_article.title}' Updated!")
  end
end