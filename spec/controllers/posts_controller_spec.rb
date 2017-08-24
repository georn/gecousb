require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before do
    @post = FactoryGirl.create(:post)
  end

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
      get :show, params: { id: @post }
      expect(response).to have_http_status(200)
    end

    it "renders the #show view" do
      get :show, params: { id: @post }
      expect(response).to render_template :show
    end
  end

  describe 'GET destroy' do
    xit "responds with 200" do
      get :destroy, params: { id: @post }
      expect(response).to have_http_status(200)
    end

    it "deletes the post" do
      expect{
        delete :destroy, params: { id: @post }
      }.to change(Post, :count).by(-1)
    end

    xit "redirects to posts" do
      expect(response).to redirect_to :show
    end
  end
end
