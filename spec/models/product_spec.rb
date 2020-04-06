require 'rails_helper'

RSpec.describe Product, type: :model do
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
