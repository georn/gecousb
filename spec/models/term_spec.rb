require 'rails_helper'

RSpec.describe Term, type: :model do
  let(:term) { Term.new }

  before do
    term.valid?
  end

  describe "validations" do
    it "requires a start date" do
      expect(term.errors[:start_date]).to include("can't be blank")
    end
    it "requires a end date" do
      expect(term.errors[:end_date]).to include("can't be blank")
    end
    it "requires a user" do
      expect(term.errors[:user]).to include("must exist")
    end
  end
end
