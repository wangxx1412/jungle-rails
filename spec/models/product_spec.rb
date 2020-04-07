require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation
RSpec.describe Product, type: :model do
  DatabaseCleaner.clean
  cat1 = Category.find_or_create_by! name: 'Fruit'
  subject { 
    described_class.new(name: "Apple", 
                        price: 12,
                        quantity: 1,
                        category_id: cat1.id

    )  
  }
  describe 'Validations' do
    it "is valid with all attributes" do
      cat2 = Category.find_or_create_by! name: 'Veggie'
      subject { 
        described_class.new(name: "cucumber", 
                            price: 12,
                            quantity: 1,
                            category_id: cat2.id
    
        )  
      }
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a category" do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
  end
end
