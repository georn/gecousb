require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:valid_post) { FactoryGirl.create(:post, user: user) }
  let(:invalid_post) { FactoryGirl.create(:post, :invalid) }

  describe "GET index" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    it "responds with 200" do
      get :show, params: { id: valid_post }
      expect(response).to have_http_status(200)
    end

    it "renders the #show view" do
      get :show, params: { id: valid_post }
      expect(response).to render_template :show
    end
  end

  describe "GET new" do
    before do
      sign_in
    end

    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET edit" do
    before do
      sign_in_as(user)
    end

    it "responds with 200" do
      get :edit, params: { id: valid_post }
      expect(response).to have_http_status(200)
    end

    it "renders the #edit view" do
      get :edit, params: { id: valid_post.id }
      expect(response).to render_template :edit
    end
  end

  describe "POST create" do
    before do
      sign_in_as(user)
      p FactoryGirl.attributes_for(:post)
    end

    context "with valid attributes" do
      it "creates a new valid_post" do
        expect {
          post :create
        }.to change(Post, :count).by(1)
      end
      it "redirects to the new post" do
        post :create, params: { post: FactoryGirl.attributes_for(:post) }
        expect(response).to redirect_to post_path(Post.last)
      end
    end

    context "with invalid attributes" do
      it "does not saves the new post" do
        expect {
          post :create, params: { post: FactoryGirl.attributes_for(:post, :invalid) }
        }.to_not change(Post, :count)
      end
      it "re-renders the new view" do
        post :create, params: { post: FactoryGirl.attributes_for(:post, :invalid) }
        expect(response).to_not redirect_to post_path(:post)
      end
    end
  end

  describe "PUT update" do
    before do
      sign_in
      post
    end

    context "with valid attributes" do
      it "located the requested post" do

      end
    end
    context "with invalid attributes"

  end

  describe 'DELETE destroy' do
    before do
      sign_in_as(user)
      post
    end

    it "deletes the post" do
      expect{
        delete :destroy, params: { id: valid_post }
      }.to change(Post, :count).by(-1)
    end

    it "redirects to posts" do
      expect(response).to redirect_to :show
    end
  end
end
