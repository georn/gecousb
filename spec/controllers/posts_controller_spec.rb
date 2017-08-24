require 'rails_helper'

RSpec.describe PostsController, type: :controller do
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
      post = FactoryGirl.create(:post)
      get :show, params: { id: post }
      expect(response).to have_http_status(200)
    end

    it "renders the #show view" do
      post = FactoryGirl.create(:post)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end
end
