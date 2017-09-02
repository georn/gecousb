require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { create(:course) }

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
      post1 = create(:post, course: course)
      post2 = create(:post, course: course)
      expect(course.posts).to include(post1, post2)
    end
    xit "have and belongs to many terms" do
      term1 = create(:term, course: course)
      expect(course.terms).to include(term)
    end
  end
end
