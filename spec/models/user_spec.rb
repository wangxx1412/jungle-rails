require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation


RSpec.describe User, type: :model do
  subject { 
    described_class.new(firstname: "joe", 
                        lastname:"doe",
                        email:"test@test.com",
                        password: "1234",
                        password_confirmation: "1234"

    )  
  }
  
  describe 'Validations' do
    it "is valid with all attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a firstname" do
      subject.firstname = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a lastname" do
      subject.lastname = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it "is not valid if password and password_confirmation not match " do
      subject.password_confirmation = "123"
      expect(subject).to_not be_valid
    end
   
    it 'is invalid if the email is not unique' do
      user1 = described_class.create!(firstname: 'foo', lastname:'jj', email: 'test@test.com', password: "12345",
                                      password_confirmation: "12345")
      expect(subject).to be_invalid
    end

    it 'is invalid if password is not longer than 2' do
      subject.password = '21'
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    DatabaseCleaner.clean
    user2 = described_class.create!(firstname: 'test', lastname:'test', email: 'any3@test.com', password: "12345",
    password_confirmation: "12345")

    user = User.authenticate_with_credentials(' any3@test.com ','12345')

    user1 = User.authenticate_with_credentials('aNy3@tEst.cOM','12345')

    it 'is valid if email contains blanks' do
      expect(user).to_not be_nil
    end

    it 'email is case-insensitive' do
      expect(user1).to_not be_nil
    end
  end
end
