require 'rails_helper'

RSpec.describe Term, type: :model do
  let(:term) { create(:term) }

  describe "attributes" do
    xit "has a start_date" do
      expect(term).to respond_to(:start_date)
    end
    xit "has a end_date" do
      expect(term).to respond_to(:end_date)
    end
    xit "has a user" do
      expect(term).to respond_to(:user)
    end
  end

  describe "validations" do
    it "requires a start date" do
      is_expected.to validate_presence_of(:start_date)
    end
    it "requires a end date" do
      is_expected.to validate_presence_of(:end_date)
    end
    it "requires a user" do
      is_expected.to validate_presence_of(:user)
    end
    it "requires the existence of a user" do
      is_expected.to validate_presence_of(:user).with_message(:required)
    end
  end

  describe "associations" do
    xit "belongs to a user" do
      expect(term.user).to be_a(User)
    end
    xit "has a belongs to many courses" do
      have_and_belong_to(:cour)
    end
  end
end
