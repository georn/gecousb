require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { Course.new }

  before do
    course.valid?
  end

  describe "validations" do
    it "requires a code" do
      expect(course.errors[:code]).to include("can't be blank")
    end
    it "requires a department" do
      expect(course.errors[:department]).to include("can't be blank")
    end
    # it "requires a career" do
    #   expect(course.errors[:careers]).to include("can't be blank")
    # end
  end
end
