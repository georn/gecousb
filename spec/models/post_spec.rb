require 'rails_helper'

describe Post do
  let(:post) { build(:post) }

    describe "attributes" do
      it "has a user" do
        expect(post).to respond_to(:user)
      end
      it "has a title" do
        expect(post).to respond_to(:title)
      end
      it "has a course" do
        expect(post).to respond_to(:course)
      end
      it "has a content" do
        expect(post).to respond_to(:content)
      end
    end
    describe "validations" do
      it { is_expected.to validate_presence_of(:user) }
      it { is_expected.to validate_presence_of(:user).with_message(:required) }
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:course).with_message(:required) }
      it { is_expected.to validate_presence_of(:course) }
      it { is_expected.to validate_presence_of(:content) }
      it "requires the title to be unique for the same user" do
        existing_post = create(:post)
        post.title = existing_post.title
        post.user = existing_post.user
        post.valid?
        expect(post.errors[:title]).to include("has already been taken")
      end
      it "does not requires the title to be unique for different users" do
        existing_post = create(:post)
        post.title = existing_post.title
        post.valid?
        expect(post.errors[:title]).not_to include("has already been taken")
      end
    end

    describe "associations" do
      it "belongs to user" do
        expect(post.user).to be_a(User)
      end
      it "belongs to course" do
        expect(post.course).to be_a(Course)
      end
    end
end
