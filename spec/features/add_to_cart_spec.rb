require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
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

  scenario "They see all products" do
    # ACT
    visit root_path
    visit root_path
    first('.product').click_button('Add')
    # VERIFY
    expect(page).to have_content('My Cart (1)')
    # puts page.html
  end
end
