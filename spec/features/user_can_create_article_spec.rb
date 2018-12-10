require 'rails_helper'

describe 'A visitor to the app' do
  it 'can click a link to create a new article' do
    visit articles_path
    
    click_link "Create a New Article"
    expect(current_path).to eq(new_article_path)
  end
  it 'can create a new article' do
    title = "Title 1"
    body = "Body 1"
    
    visit new_article_path
    
    fill_in :article_title, with: title
    fill_in :article_body, with: body
    click_button "Create Article"
    
    expect(current_path).to eq(article_path(Article.last))
    expect(page).to have_content(title)
    expect(page).to have_content(body)
    expect(page).to have_content("Article '#{Article.last.title}' Created!")
    
  end
end