require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe StaticPagesHelper, type: :helper do
  describe '#full_title' do
    it "returns the default title" do
      expect(helper.full_title).to eq('Geco USB')
    end

    it "returns the default title with the page title if provided" do
      expect(helper.full_title("Home")).to eq ('Home | Geco USB')
    end
  end
end
