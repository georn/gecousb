require 'rails_helper'

RSpec.describe CoursesPlan, type: :model do
  let(:courses_plan) { CoursesPlan.new }

  before do
    courses_plan.valid?
  end

  describe "validations" do
    it "requires a start date" do
      expect(courses_plan.errors[:start_date]).to include("can't be blank")
    end
    it "requires a end date" do
      expect(courses_plan.errors[:end_date]).to include("can't be blank")
    end
    it "requires a user" do
      expect(courses_plan.errors[:user]).to include("must exist")
    end
  end
end
