require 'rails_helper'

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
      user1.save
      expect(subject).to be_invalid
    end

  end
end
