require 'rails_helper'

describe Post do
    describe "validations" do
      let(:post) { Post.new }

      before do
        post.valid?
      end

      it "requires a user" do
        expect(post.errors[:user]).to include("must exist")
      end
      it "requires a title" do
        expect(post.errors[:title]).to include("can't be blank")
      end
      it "requires a course" do
        expect(post.errors[:course]).to include("can't be blank")
      end
      it "requires content" do
        expect(post.errors[:content]).to include("can't be blank")
      end
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
end
