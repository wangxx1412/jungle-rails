require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.feature "Visitor navigates to Product Detail page", type: :feature, js: true do
  # SETUP
  DatabaseCleaner.clean
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: File.open(Rails.root.join('db', 'seed_assets', 'apparel1.jpg')),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product feature page" do
    # ACT
    visit root_path
    first('.product').click_link('Details')
    # save_screenshot
    
    # VERIFY
    expect(page).to have_css 'article.product-detail'
    expect(page).not_to have_css 'article.product'
    expect(page).to have_content('Apparel')
    puts page.html
  end
end
