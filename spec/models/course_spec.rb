require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { create(:course) }
  let(:course_with_posts) { create(:course, :with_posts) }
  let(:course_with_terms) { create(:course, :with_terms) }

  describe "attributes"do
    it "has a code" do
      expect(course).to respond_to(:code)
    end
    it "has a name" do
      expect(course).to respond_to(:name)
    end
    it "has a department" do
      expect(course).to respond_to(:department)
    end

  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:department) }
  end

  describe "associations" do
    it "have many posts" do
      expect(course_with_posts.posts.count).to eq(2)
    end
    it "have and belongs to many terms" do
      term = course_with_terms.terms.first
      expect(course_with_terms.terms.count).to eq(2)
      expect(term.courses.first).to eq(course_with_terms)
    end
  end
end
