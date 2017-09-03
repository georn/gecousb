require 'rails_helper'

RSpec.describe Term, type: :model do
  let(:term) { create(:term) }
  let(:term_with_courses) {create(:term, :with_courses)}

  describe "attributes" do
    it "has a start_date" do
      expect(term).to respond_to(:start_date)
    end
    it "has a end_date" do
      expect(term).to respond_to(:end_date)
    end
    it "has a user" do
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
    it "belongs to a user" do
      expect(term.user).to be_a(User)
    end
    it "has and belongs to many courses" do
      course = term_with_courses.courses.first
      expect(term_with_courses.courses.count).to eq(2)
      expect(course.terms.first).to eq(term_with_courses)
    end
  end
end
